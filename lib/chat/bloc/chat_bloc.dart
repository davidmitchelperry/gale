import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:meta/meta.dart';
import 'package:gale/chat/chat.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:profile_repository/profile_repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;
  final ProfileRepository _profileRepository;
  final AuthenticationRepository _authenticationRepository;

  StreamSubscription _chatIdsSubscription;
  List<StreamSubscription> _chatSubscriptions = [];

  User u;

  ChatBloc({
    @required ChatRepository chatRepository,
    @required AuthenticationRepository authenticationRepository,
    @required ProfileRepository profileRepository,
  })  : assert(chatRepository != null),
        _chatRepository = chatRepository,
        _authenticationRepository = authenticationRepository,
        _profileRepository = profileRepository,
        super(ChatState({}, {}, {})) {
    // TODO: These two user fields are gross
    authenticationRepository.user.listen((user) {
      u = user;
      _chatRepository.users(user.id).listen((me) {
        add(ChatPartnersUpdateEvent(me.chatIds));
      });
    });
  }

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is ChatPartnersUpdateEvent) {
      yield* _mapLoadChatPartnersUpdateEvent(event);
    } else if (event is NewChatPartnerEvent) {
      yield* _mapNewChatPartnerEvent(event);
    } else if (event is ChatExpiredEvent) {
      yield* _mapChatExpriedEvent(event);
    } else if (event is NewMessageEvent) {
      yield* _mapNewMessageEvent(event);
    } else if (event is SendMessageEvent) {
      yield* _mapSendMessageEvent(event);
    } else if (event is LoadPartnersProfileEvent) {
      yield* _mapLoadPartnersProfileEvent(event);
    }
  }

  Stream<ChatState> _mapLoadPartnersProfileEvent(
      LoadPartnersProfileEvent event) async* {
    ChatState newState = state.clone();
    Profile p = await _profileRepository.readProfile(event.theirId);
    newState.profileMap.update(event.theirId, (v) => p, ifAbsent: () => p);
    //_profileRepository.readProfile(event.theirId).then((Profile profile) {
    //  print("PROFILE: " + profile.toString());
    //});
    yield newState;
  }

  Stream<ChatState> _mapSendMessageEvent(SendMessageEvent event) async* {
    _chatRepository.sendMessage(u.id, event.userid, event.message);
  }

  Stream<ChatState> _mapChatExpriedEvent(ChatExpiredEvent event) async* {
    ChatState newState = state.clone();
    newState.messageHistoryMap.remove(event.userid);

    state.chatsSubscriptionMap[event.userid].cancel();
    newState.chatsSubscriptionMap.remove(event.userid);

    yield newState;
  }

  Stream<ChatState> _mapNewMessageEvent(NewMessageEvent event) async* {
    ChatState newState = state.clone();
    newState.messageHistoryMap.update(event.userid, (v) => event.history,
        ifAbsent: () => event.history);
    yield newState;
  }

  Stream<ChatState> _mapLoadChatPartnersUpdateEvent(
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

  Stream<ChatState> _mapNewChatPartnerEvent(NewChatPartnerEvent event) async* {
    ChatState newState = state.clone();
    // Add the new chat partner
    newState.chatsSubscriptionMap.update(event.userid, (v) => v, ifAbsent: () {
      add(LoadPartnersProfileEvent(event.userid));
      _chatRepository.getChatStream(u.id, event.userid).listen((history) {
        add(NewMessageEvent(event.userid, history));
      });
    });
    yield newState;
  }
}
