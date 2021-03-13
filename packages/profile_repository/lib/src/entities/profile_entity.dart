// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String imagesUrl;

  const ProfileEntity(this.firstName, this.lastName, this.imagesUrl);

  Map<String, Object> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'imagesUrl': imagesUrl,
    };
  }

  @override
  List<Object> get props => [firstName, lastName, imagesUrl];

  @override
  String toString() {
    return 'ProfileEntity { firstName: $firstName, lastName: $lastName, imagesUrl: $imagesUrl }';
  }

  static ProfileEntity fromJson(Map<String, Object> json) {
    return ProfileEntity(
      json['firstName'] as String,
      json['firstName'] as String,
      json['imagesUrl'] as String,
    );
  }

  static ProfileEntity fromSnapshot(DocumentSnapshot snap) {
    return ProfileEntity(snap.data()['firstName'], snap.data()['lastName'],
        snap.data()['imagesUrl']);
  }

  Map<String, Object> toDocument() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'profileUrl': imagesUrl,
    };
  }
}
