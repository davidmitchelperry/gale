// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'entities/entities.dart';

class FirebaseProfileRepository implements ProfileRepository {
  final profileCollection = FirebaseFirestore.instance.collection("profiles");

  @override
  Future<void> createNewProfile(Profile profile, AuthInfo authInfo) {
    return profileCollection.doc(authInfo.id).set({
      "firstName": profile.firstName,
      "lastName": profile.lastName,
    });
  }

  @override
  Future<void> updateProfile(Profile profile, AuthInfo authInfo) {
    return profileCollection.doc(authInfo.id).set({
      "firstName": profile.firstName,
      "lastName": profile.lastName,
    });
  }

  @override
  Future<Profile> readProfile(String userid) async {
    var snapshot = await profileCollection.doc(userid).get();
    var pe = ProfileEntity.fromSnapshot(snapshot);
    return Profile.fromEntity(pe);
  }

  Future<List<String>> _getImageUrls(String userid) async {
    List<String> result = [];
    //List<

  }

  //@override
  //Future<String> getProfileImageUrl(String userid) async {
  //  String profileImageUrl = await FirebaseStorage.instance.ref('profiles/userid1/images')
  //}
}
