// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class OpenChatsEntity extends Equatable {

  final String chatId;

  const OpenChatsEntity(this.chatId);

  Map<String, Object> toJson() {
    return {
      'chatId': chatId,
    };
  }

  @override
  List<Object> get props => [chatId];

  @override
  String toString() {
    return 'OpenChatsEntity { chatIds: $chatId }';
  }

  static OpenChatsEntity fromJson(Map<String, Object> json) {
    return OpenChatsEntity(
      json['chatId'] as String,
    );
  }

  static OpenChatsEntity fromSnapshot(DocumentSnapshot snap) {
    return OpenChatsEntity(
      snap.data()['chatId'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'chatId': chatId,
    };
  }
}
