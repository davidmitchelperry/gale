import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:gale/chat/chat.dart';
import 'package:gale/chat/widgets/message_list_item.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  final String userid;

  ChatPage({this.userid});

  //Route route() {
  //  return MaterialPageRoute<void>(builder: (_) => ChatPage());
  //}

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    final chatsMap = context.select((ChatBloc bloc) => bloc.state.chatsMap);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          //user.name,
          "test",
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      //body: GestureDetector(
      //  onTap: () => FocusScope.of(context).unfocus(),
      //  child: Column(
      //    children: <Widget>[
      //      Expanded(
      //        child: Container(
      //          decoration: BoxDecoration(
      //            color: Colors.white,
      //            borderRadius: BorderRadius.only(
      //              topLeft: Radius.circular(30.0),
      //              topRight: Radius.circular(30.0),
      //            ),
      //          ),
      //          child: ClipRRect(
      //            borderRadius: BorderRadius.only(
      //              topLeft: Radius.circular(30.0),
      //              topRight: Radius.circular(30.0),
      //            ),
      //            child: ListView.builder(
      //              reverse: true,
      //              padding: EdgeInsets.only(top: 15.0),
      //              itemCount: chatsMap[userid].messages.length,
      //              itemBuilder: (BuildContext context, int index) {
      //                final Message message = chatsMap[userid].messages[index];
      //                final bool isMe = userid == user.id;
      //                return MessageListItem(message, isMe);
      //              },
      //            ),
      //          ),
      //        ),
      //      ),
      //      MessageComposer(),
      //      //_buildMessageComposer(context),
      //    ],
      //  ),
      //),
    );
  }
}
