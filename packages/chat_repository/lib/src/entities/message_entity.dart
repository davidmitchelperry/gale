// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {

  final bool isLiked;
  final String sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  const MessageEntity({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });

  @override
  List<Object> get props => [sender, time, text, isLiked, unread];

  @override
  String toString() {
    return 'MessageEntity { sender: $sender, time: $time, text: $text, isLiked: $isLiked, unread: $unread  }';
  }

  static MessageEntity fromSnapshot(QuerySnapshot snap) {

    // `snap` is a snapshot for the collection, thus we must index it
    // (like an array) and use the first message for testing purposes
    return MessageEntity(
      sender: snap.docs[0].data()['sender'],
      time: snap.docs[0].data()['time'],
      text: snap.docs[0].data()['text'],
      isLiked: snap.docs[0].data()['isLiked'],
      unread: snap.docs[0].data()['unread'],
    );
  }

}
