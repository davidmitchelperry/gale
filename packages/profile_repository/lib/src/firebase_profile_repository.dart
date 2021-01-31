// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'entities/entities.dart';

class FirebaseProfileRepository implements ProfileRepository {

  final profiles = FirebaseFirestore.instance.collection("profiles");

  @override
  Future<void> createNewProfile(Profile profile, User user) {
    return profiles.doc(user.id).set(
      {
        "firstName" : profile.firstName,
        "lastName" : profile.lastName,
      }
    );
    //return todoCollection.add(todo.toEntity().toDocument());
  }

  //@override
  //Future<void> updateProfile(Profile profile) {
  //  return profiles.doc(update.id).update(update.toEntity().toDocument());
  //}

//@override
  //Future<void> deleteTodo(Profile todo) async {
  //  return todoCollection.doc(todo.id).delete();
  //}

  //@override
  //Stream<List<Profile>> todos() {
  //  return todoCollection.snapshots().map((snapshot) {
  //    return snapshot.docs
  //        .map((doc) => Profile.fromEntity(ProfileEntity.fromSnapshot(doc)))
  //        .toList();
  //  });
  //}

  //@override
  //Future<void> updateTodo(Profile update) {
  //  return todoCollection.doc(update.id).update(update.toEntity().toDocument());
  //}
}