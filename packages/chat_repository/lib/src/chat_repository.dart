import 'dart:async';
import 'package:chat_repository/chat_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:chat_repository/src/models/models.dart';

abstract class ChatRepository {

 Stream<OpenChats> openChats(String userid);

  //Future<void> createNewProfile(Profile profile, User userid);

  //Future<void> updateProfile(Profile profile, User userid);

  //Future<Profile> readProfile(String userid);

//Stream<List<Profile>> friendsList(); Just a thought... Maybe make a friends list repo
}
