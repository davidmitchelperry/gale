import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_repository/chat_repository.dart';
import 'entities/entities.dart';

class FirebaseChatRepository implements ChatRepository {

  final _usersCollection = FirebaseFirestore.instance.collection('users');
  final _chatsCollection = FirebaseFirestore.instance.collection('chats');

  @override
  Stream<Users> chatIds(String userid) {
    Stream documentStream = _usersCollection.doc(userid).snapshots();
    return documentStream.map<Users>((snapshot) {
      return Users.fromEntity(UsersEntity.fromSnapshot(snapshot));
    });
  }

  String _getChatId(String myUserId, String theirUserId) {
    // Sort both user ids and join them to get chat id
    var chatIds = [myUserId, theirUserId];
    chatIds.sort();
    return chatIds.join();
  }

  @override
  Stream<Message> getChat(String myUserId, String theirUserId) {
    var chatId = _getChatId(myUserId, theirUserId);
    Stream chatStream = _chatsCollection.doc(chatId).collection('messages').snapshots();
    return chatStream.map<Message>((snapshot) {
      return Message.fromEntity(MessageEntity.fromSnapshot(snapshot));
    });
  }
}
