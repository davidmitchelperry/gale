// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {

  final int id;
  final bool isLiked;
  final String sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  const MessageEntity({
    this.id,
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });

  @override
  List<Object> get props => [id, sender, time, text, isLiked, unread];

  @override
  String toString() {
    return 'MessageEntity { id: $id, sender: $sender, time: $time, text: $text, isLiked: $isLiked, unread: $unread  }';
  }

  static MessageEntity fromSnapshot(DocumentSnapshot snap) {

    // `snap` is a snapshot for the collection, thus we must index it
    // (like an array) and use the first message for testing purposes
    return MessageEntity(
      id: snap.data()['id'],
      sender: snap.data()['sender'],
      time: snap.data()['time'],
      text: snap.data()['text'],
      isLiked: snap.data()['isLiked'],
      unread: snap.data()['unread'],
    );
  }

}
