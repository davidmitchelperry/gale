import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart';

abstract class ChatState extends Equatable {

  //final Future<Profile> profile;
  final List<String> chatIds;

  const ChatState(this.chatIds);

  @override
  List<Object> get props => [chatIds];
}

class ChatLoading extends ChatState {

  const ChatLoading(List<String> chatIds) : super(chatIds);

  @override
  List<Object> get props => [chatIds];

  @override
  String toString() => 'ProfileLoading { chatIds: $chatIds }';
}

class ChatLoaded extends ChatState {

  const ChatLoaded(List<String> chatIds) : super(chatIds);

  @override
  List<Object> get props => [chatIds];

  @override
  String toString() => 'ChatLoaded {chatIds: $chatIds }';
}

//class ProfileCouldNotLoad extends ProfileState {
//  const ProfileCouldNotLoad()
//}
