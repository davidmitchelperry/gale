import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:gale/chat/chat.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:chat_repository/chat_repository.dart';

class ChatsState extends Equatable {
  // Visual State information
  final Map<String, MessageHistory> chatsMap;

  // Internal State Information
  final Map<String, StreamSubscription<MessageHistory>> chatsSubscriptionMap;

  const ChatsState(this.chatsMap, this.chatsSubscriptionMap);

  @override
  List<Object> get props => [chatsMap, chatsSubscriptionMap];

  ChatsState clone() {
    // Copy chatsMap
    Map<String, MessageHistory> newChatsMap = {};
    chatsMap.forEach((userid, history) {
      newChatsMap.update(userid, (v) => v, ifAbsent: () => history);
    });
    // Copy chatsSubscriptionMap
    Map<String, StreamSubscription<MessageHistory>> newChatsSubscriptionMap =
        {};
    chatsSubscriptionMap.forEach((userid, sub) {
      newChatsSubscriptionMap.update(userid, (v) => v, ifAbsent: () => sub);
    });
    return ChatsState(newChatsMap, newChatsSubscriptionMap);
  }
}
