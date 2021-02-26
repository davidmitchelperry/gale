import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:meta/meta.dart';
import 'package:gale/chat/chat.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {

  final ChatRepository _chatRepository;
  final AuthenticationRepository _authenticationRepository;

  StreamSubscription _chatIdsSubscription;
  List<StreamSubscription> _chatSubscriptions = [];

      ChatBloc({
        @required ChatRepository chatRepository,
        @required AuthenticationRepository authenticationRepository,
      }) :
            assert(chatRepository != null),
            _chatRepository = chatRepository,
            _authenticationRepository = authenticationRepository,
            super(ChatInitial({})) {
              authenticationRepository.user.listen(
                (user) {
                  // Setup the subscription for all user chat ids
                  _chatIdsSubscription = chatRepository.chatIds(user.id).listen((item) {
                    //add(LoadChat(item.chatIds));
                    for (final id in item.chatIds) {
                      _chatSubscriptions.add(_chatRepository.getChatStream(user.id, id).listen(
                            (history) => add(LoadChat(id, history)),
                      ));
                    }
                  });
                }
              );
            }

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is LoadChat) {
      yield* _mapLoadChatToState(event);
    }
    //else if (event is CreateChat) {
    // yield* _mapCreateChatToState(event);
    //} else if (event is UpdateChat) {
    //  yield* _mapUpdateChatToState(event);
    //} else if (event is ReadChat) {
    //  yield* _mapReadChatToState(event);
    //} else if (event is LoadChatComplete) {
    //  yield* _mapLoadChatCompleteToState(event);
    //}
  }

  Stream<ChatState> _mapLoadChatToState(LoadChat event) async* {
        state.chatsMap.update(event.userid, (v) => event.messageHistory, ifAbsent: () => event.messageHistory);
        yield ChatLoaded(state.chatsMap);
        //state.chatsMap.add
        //state.chatsMap
        //ChatLoaded(event.

    //yield ChatLoaded(event.userid);
  }

//Stream<ChatState> _mapCreateChatToState(CreateChat event) async* {
//  _profileRepository.createNewChat(event.profile, event.user);
//}

//Stream<ChatState> _mapUpdateChatToState(UpdateChat event) async* {
//  _profileRepository.updateChat(event.profile, event.user);
//}

//  Stream<ChatState> _mapReadChatToState(ReadChat event) async* {
//    yield ChatLoading('userid: ${event.userid}');
//    _profileRepository.readChat(event.userid).then((Chat profile) {
//      //yield ChatLoaded(profile.firstName);
//      add(LoadChatComplete(profile.firstName));
//    },
//    onError: (e) {
//
//    });
//  }
//
//  Stream<ChatState> _mapLoadChatCompleteToState(LoadChatComplete event) async* {
//    yield ChatLoaded(event.userid);
//  }
//
//Stream<TodosState> _mapUpdateTodoToState(UpdateTodo event) async* {
//  _todosRepository.updateTodo(event.updatedTodo);
//}

//Stream<TodosState> _mapDeleteTodoToState(DeleteTodo event) async* {
//  _todosRepository.deleteTodo(event.todo);
//}

//Stream<TodosState> _mapToggleAllToState() async* {
//  final currentState = state;
//  if (currentState is TodosLoaded) {
//    final allComplete = currentState.todos.every((todo) => todo.complete);
//    final List<Todo> updatedTodos = currentState.todos
//        .map((todo) => todo.copyWith(complete: !allComplete))
//        .toList();
//    updatedTodos.forEach((updatedTodo) {
//      _todosRepository.updateTodo(updatedTodo);
//    });
//  }
//}

//Stream<TodosState> _mapClearCompletedToState() async* {
//  final currentState = state;
//  if (currentState is TodosLoaded) {
//    final List<Todo> completedTodos =
//        currentState.todos.where((todo) => todo.complete).toList();
//    completedTodos.forEach((completedTodo) {
//      _todosRepository.deleteTodo(completedTodo);
//    });
//  }
//}

//Stream<TodosState> _mapTodosUpdateToState(TodosUpdated event) async* {
//  yield TodosLoaded(event.todos);
//}

//@override
//Future<void> close() {
//  _todosSubscription?.cancel();
//  return super.close();
//}
}
