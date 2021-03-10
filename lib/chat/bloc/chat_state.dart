import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:gale/chat/chat.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:chat_repository/chat_repository.dart';

class ChatState extends Equatable {
  // Visual State information
  final Map<String, MessageHistory> messageHistoryMap;
  //final Map<String, Profile>

  // Internal State Information
  final Map<String, StreamSubscription<MessageHistory>> chatsSubscriptionMap;

  const ChatState(this.messageHistoryMap, this.chatsSubscriptionMap);

  @override
  List<Object> get props => [messageHistoryMap, chatsSubscriptionMap];

  ChatState clone() {
    // Copy chatsMap
    Map<String, MessageHistory> newMessageHistoryMap = {};
    messageHistoryMap.forEach((theirId, history) {
      newMessageHistoryMap.update(theirId, (v) => v, ifAbsent: () => history);
    });
    // Copy chatsSubscriptionMap
    Map<String, StreamSubscription<MessageHistory>> newChatsSubscriptionMap =
        {};
    chatsSubscriptionMap.forEach((theirId, sub) {
      newChatsSubscriptionMap.update(theirId, (v) => v, ifAbsent: () => sub);
    });
    return ChatState(newMessageHistoryMap, newChatsSubscriptionMap);
  }
}
