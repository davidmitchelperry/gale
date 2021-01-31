// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'package:profile_repository/profile_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

abstract class ProfileRepository {

  Future<void> createNewProfile(Profile profile, User userid);

  //Future<void> updateProfile(Profile profile);

  //Future<void> readProfile(Profile profile);

  //Stream<List<Profile>> friendsList(); Just a thought...
}
