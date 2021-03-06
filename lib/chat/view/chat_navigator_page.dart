import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/chat/chat.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:gale/chat/chat.dart';
import 'package:gale/authentication/authentication.dart';

class ChatNavigatorPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ChatNavigatorPage());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    final chatsMap = context.select((ChatBloc bloc) => bloc.state.chatsMap);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 20.0,
          color: Colors.white,
        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        elevation: 3.0,
        actions: <Widget>[],
      ),
      body: Column(
        children: <Widget>[
          RecentChats(),
        ],
      ),
    );
  }
}
