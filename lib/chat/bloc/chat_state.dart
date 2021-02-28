import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:gale/chat/chat.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:chat_repository/chat_repository.dart';

class ChatsState extends Equatable {
  // Visual State information
  final Map<String, Message> chatsMap;

  // Internal State Information
  final Map<String, StreamSubscription<MessageHistory>> chatsSubscriptionMap;
  final List<String> chatsUserIds;

  const ChatsState(this.chatsMap, this.chatsSubscriptionMap, this.chatsUserIds);

  @override
  List<Object> get props => [chatsMap, chatsSubscriptionMap, this.chatsUserIds];
}
