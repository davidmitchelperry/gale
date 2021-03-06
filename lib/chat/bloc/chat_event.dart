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

class LoadPartnersProfileEvent extends ChatEvent {
  final String theirId;

  const LoadPartnersProfileEvent(this.theirId);

  @override
  List<Object> get props => [theirId];

  @override
  String toString() => 'ChatPartnersUpdate { theirId: $theirId }';
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

class SendMessageEvent extends ChatEvent {
  final String userid;
  final Message message;

  const SendMessageEvent(this.userid, this.message);

  @override
  List<Object> get props => [userid, message];

  @override
  String toString() =>
      'SendMessageEvent { userid: $userid, message: $message }';
}
