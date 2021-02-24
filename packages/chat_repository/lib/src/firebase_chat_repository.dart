import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_repository/chat_repository.dart';
import 'entities/entities.dart';

class FirebaseChatRepository implements ChatRepository {

  final openChatsCollection = FirebaseFirestore.instance.collection('users');

  //@override
  //Future<void> addNewTodo(Todo todo) {
  //  return todoCollection.add(todo.toEntity().toDocument());
  //}

  //@override
  //Future<void> deleteTodo(Todo todo) async {
  //  return todoCollection.doc(todo.id).delete();
  //}

  @override
  Stream<OpenChats> openChats(String userid) {
    Stream documentStream = openChatsCollection.doc(userid).snapshots();
    return documentStream.map((snapshot) {
      return OpenChats.fromEntity(OpenChatsEntity.fromSnapshot(snapshot));
    });

    //return documentStream;
    //return openChatsCollection.snapshots().map((snapshot) {
    //  return OpenChats.fromEntity(OpenChatsEntity.fromSnapshot(snapshot));
    //});

    //openChatsCollection.doc(userid).get().then((value) { //  return OpenChats.fromEntity(OpenChatsEntity.fromSnapshot(value));
    //});
    //return
    //OpenChatsEntity.fromSnapshot(openChatsCollection.doc(userid).get());
    //return openChatsCollection.snapshots().map((snapshot) {
    //  //snapshot[]
    //  //return OpenChats.fromEntity(OpenChatsEntity.fromSnapshot(snapshot));
    //});
  }

  //@override
  //Future<void> updateTodo(Todo update) {
  //  return todoCollection.doc(update.id).update(update.toEntity().toDocument());
  //}
}
