// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:chat_repository/chat_repository.dart';


class MessageHistoryEntity extends Equatable {

  final List<MessageEntity> messages;

  const MessageHistoryEntity({
    this.messages,
  });

  @override
  List<Object> get props => [messages];

  @override
  String toString() {
    return 'MessageHistoryEntity { messages: $messages }';
  }

  static MessageHistoryEntity fromSnapshot(QuerySnapshot snap) {

    List<MessageEntity> history = [];
    for (final msg in snap.docs) {
      history.add(
          MessageEntity(
            id: msg.data()['id'],
            sender: msg.data()['sender'],
            time: msg.data()['time'],
            text: msg.data()['text'],
            isLiked: msg.data()['isLiked'],
            unread: msg.data()['unread'],
          ));
    }
    return MessageHistoryEntity(messages: history);
  }

}
