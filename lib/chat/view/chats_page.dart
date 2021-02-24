import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/chat/chat.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:gale/chat/chat.dart';
import 'package:gale/authentication/authentication.dart';

class ChatsPage extends StatelessWidget {

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ChatsPage());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              return Text(
                state.chatId,
                textAlign: TextAlign.center,
              );
            },
          ),
          //Text("RAWR"),
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}