import 'dart:async';

import 'package:chat_repository/chat_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
  @override
  List<Object> get props => [];
}

class ChatPartnersUpdateEvent extends ChatEvent {
  final List<String> userids;

  const ChatPartnersUpdateEvent(this.userids);

  @override
  List<Object> get props => [userids];

  @override
  String toString() => 'ChatPartnersUpdate { userids: $userids }';
}

class NewChatPartnerEvent extends ChatEvent {
  final String userid;

  const NewChatPartnerEvent(this.userid);

  @override
  List<Object> get props => [userid];

  @override
  String toString() => 'NewChatPartnerEvent { userid: $userid }';
}

class NewMessageEvent extends ChatEvent {
  final String userid;
  final MessageHistory history;

  const NewMessageEvent(this.userid, this.history);

  @override
  List<Object> get props => [userid, history];

  @override
  String toString() => 'NewMessageEvent { userid: $userid, history: $history }';
}

class ChatExpiredEvent extends ChatEvent {
  final String userid;

  const ChatExpiredEvent(this.userid);

  @override
  List<Object> get props => [userid];

  @override
  String toString() => 'ChatExpiredEvent { userid: $userid }';
}
