import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:meta/meta.dart';
import 'package:gale/profile/profile.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;
  //final AuthenticationBloc _authenticationRepository;
  StreamSubscription _profileSubscription;

  ProfileBloc({
    @required ProfileRepository profileRepository,
    @required AuthenticationRepository authenticationRepository,
  }) : assert(profileRepository != null),
        _profileRepository = profileRepository,
        //_authenticationRepository = authenticationRepository,
        super(ProfileLoading());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      //yield* _mapLoadProfileToState();
    } else if (event is CreateProfile) {
     yield* _mapCreateProfileToState(event);
    } else if (event is UpdateProfile) {
      //yield* _mapUpdateTodoToState(event);
    } else if (event is ProfileUpdated) {
      //yield* _mapDeleteTodoToState(event);
    }
  }

  Stream<ProfileState> _mapCreateProfileToState(CreateProfile event) async* {
    _profileRepository.createNewProfile(event.profile, event.user);
  }

  //Stream<TodosState> _mapAddTodoToState(AddTodo event) async* {
  //  _todosRepository.addNewTodo(event.todo);
  //}

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
