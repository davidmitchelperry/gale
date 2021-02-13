import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {

}

class CreateProfile extends ProfileEvent {

  final Profile profile;
  final User user;

  const CreateProfile(this.profile, this.user);

  @override
  List<Object> get props => [profile];

  @override
  String toString() => 'CreateProfile { firstName: $profile.firstName, lastName: $profile.lastName }';
}

class UpdateProfile extends ProfileEvent {

  final Profile profile;
  final User user;

  const UpdateProfile(this.profile, this.user);

  @override
  List<Object> get props => [profile];

  @override
  String toString() => 'UpdateProfile { firstName: $profile.firstName, lastName: $profile.lastName }';
}

class ReadProfile extends ProfileEvent {
  final String userid;

  const ReadProfile(this.userid);

  @override
  List<Object> get props => [userid];

  @override
  String toString() => 'ReadProfile { userid: $userid }';
}

class LoadProfileComplete extends ProfileEvent {
  final String userid;

  const LoadProfileComplete(this.userid);

  @override
  List<Object> get props => [userid];

  @override
  String toString() => 'ProfileLoadComplte { userid: $userid }';
}


//class DeleteProfile extends ProfileEvent {
//  final  todo;
//
//  const DeleteTodo(this.todo);
//
//  @override
//  List<Object> get props => [todo];
//
//  @override
//  String toString() => 'DeleteTodo { todo: $todo }';
//}

