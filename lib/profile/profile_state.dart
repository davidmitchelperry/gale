import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  //final List<Todo> todos;

  const ProfileLoaded();
  //const ProfileLoaded([this.todos = const []]);

  @override
  List<Object> get props => [];

  //@override
  //String toString() => 'ProfileLoaded { todos: $todos }';
}

class ProfileNotLoaded extends ProfileState {}
