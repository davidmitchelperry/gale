import 'package:flutter/material.dart';
import 'package:gale/chat/chat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:gale/chat/widgets/recent_chat_list_item.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get information you need from BLoCs
    final chatsMap = context.select((ChatBloc bloc) => bloc.state.chatsMap);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ClipRRect(
          child: ListView.builder(
            itemCount: chatsMap.length,
            itemBuilder: (BuildContext context, int index) {
              final String userid = chatsMap.keys.toList()[index];
              final Message recentMessage = chatsMap[userid].messages.last;
              return RecentChatListItem(
                  userid: userid, recentMessage: recentMessage);
            },
          ),
        ),
      ),
    );
  }
}
