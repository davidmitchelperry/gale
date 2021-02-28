import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:meta/meta.dart';
import 'package:gale/chat/chat.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatsState> {
  final ChatRepository _chatRepository;
  final AuthenticationRepository _authenticationRepository;

  StreamSubscription _chatIdsSubscription;
  List<StreamSubscription> _chatSubscriptions = [];

  User u;

  ChatBloc({
    @required ChatRepository chatRepository,
    @required AuthenticationRepository authenticationRepository,
  })  : assert(chatRepository != null),
        _chatRepository = chatRepository,
        _authenticationRepository = authenticationRepository,
        super(ChatsState({}, {})) {
    authenticationRepository.user.listen((user) {
      u = user;
      _chatRepository.users(user.id).listen((me) {
        add(ChatPartnersUpdateEvent(me.chatIds));
      });
    });
  }

  @override
  Stream<ChatsState> mapEventToState(ChatEvent event) async* {
    if (event is ChatPartnersUpdateEvent) {
      yield* _mapLoadChatPartnersUpdateEvent(event);
    } else if (event is NewChatPartnerEvent) {
      yield* _mapNewChatPartnerEvent(event);
    } else if (event is ChatExpiredEvent) {
      yield* _mapChatExpriedEvent(event);
    } else if (event is NewMessageEvent) {
      yield* _mapNewMessageEvent(event);
    }
  }

  Stream<ChatsState> _mapChatExpriedEvent(ChatExpiredEvent event) async* {
    ChatsState newState = state.clone();
    newState.chatsMap.remove(event.userid);

    state.chatsSubscriptionMap[event.userid].cancel();
    newState.chatsSubscriptionMap.remove(event.userid);

    yield newState;
  }

  Stream<ChatsState> _mapNewMessageEvent(NewMessageEvent event) async* {
    ChatsState newState = state.clone();
    newState.chatsMap
        .update(event.userid, (v) => v, ifAbsent: () => event.history);

    yield newState;
  }

  Stream<ChatsState> _mapLoadChatPartnersUpdateEvent(
      ChatPartnersUpdateEvent event) async* {
    // Cancel Expired Chat Subscriptions
    state.chatsSubscriptionMap.forEach((userid, subscription) {
      if (!event.userids.contains(userid)) {
        add(ChatExpiredEvent(userid));
      }
    });
    // Add New Chat Partners
    event.userids.forEach((userid) {
      add(NewChatPartnerEvent(userid));
    });
  }

  Stream<ChatsState> _mapNewChatPartnerEvent(NewChatPartnerEvent event) async* {
    ChatsState newState = state.clone();
    // Add the new chat partner
    newState.chatsSubscriptionMap.update(event.userid, (v) => v,
        ifAbsent: () =>
            _chatRepository.getChatStream(u.id, event.userid).listen((history) {
              add(NewMessageEvent(event.userid, history));
            }));

    yield newState;
  }
}
