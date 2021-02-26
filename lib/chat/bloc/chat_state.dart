import 'package:equatable/equatable.dart';
import 'package:gale/chat/chat.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:chat_repository/chat_repository.dart';

abstract class ChatState extends Equatable {

  final Map<String, MessageHistory> chatsMap;

  const ChatState(this.chatsMap);

  @override
  List<Object> get props => [chatsMap];
}

class ChatInitial extends ChatState {

  const ChatInitial(Map<String, MessageHistory> chatsMap) : super(chatsMap);

  @override
  List<Object> get props => [chatsMap];

  @override
  String toString() => 'ProfileLoading { chatsMap: $chatsMap }';
}

class ChatLoading extends ChatState {

  const ChatLoading(Map<String, MessageHistory> chatsMap) : super(chatsMap);

  @override
  List<Object> get props => [chatsMap];

  @override
  String toString() => 'ProfileLoading { chatsMap: $chatsMap }';
}

class ChatLoaded extends ChatState {

  const ChatLoaded(Map<String, MessageHistory> chatsMap) : super(chatsMap);

  @override
  List<Object> get props => [chatsMap];

  @override
  String toString() => 'ChatLoaded {chatsMap: $chatsMap }';
}

//class ProfileCouldNotLoad extends ProfileState {
//  const ProfileCouldNotLoad()
//}
