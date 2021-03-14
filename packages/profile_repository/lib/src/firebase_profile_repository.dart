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
  final storage = FirebaseStorage.instance;

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
    Profile result = Profile.fromEntity(pe);
    List<String> urls = await _getImageUrls(userid);
    urls.forEach((url) {
      result.imageUrls.add(url);
    });
    return result;
  }

  Future<List<String>> _getImageUrls(String userid) async {
    List<String> result = [];
    ListResult imageRefs = await storage
        .ref()
        .child('profiles')
        .child(userid)
        .child('images')
        .listAll();
    for (final ref in imageRefs.items) {
      result.add(await ref.getDownloadURL());
    }
    return result;
  }
}
