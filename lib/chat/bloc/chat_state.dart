import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart';

abstract class ChatState extends Equatable {

  //final Future<Profile> profile;
  final String chatId;

  const ChatState(this.chatId);

  @override
  List<Object> get props => [chatId];
}

class ChatLoading extends ChatState {

  const ChatLoading(String chatId) : super(chatId);

  @override
  List<Object> get props => [chatId];

  @override
  String toString() => 'ProfileLoading { chatId: $chatId }';
}

class ChatLoaded extends ChatState {

  const ChatLoaded(String chatId) : super(chatId);

  @override
  List<Object> get props => [chatId];

  @override
  String toString() => 'ChatLoaded {chatId: $chatId }';
}

//class ProfileCouldNotLoad extends ProfileState {
//  const ProfileCouldNotLoad()
//}
