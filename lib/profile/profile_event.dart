import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {}

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

  final Profile updatedProfile;

  const UpdateProfile(this.updatedProfile);

  @override
  List<Object> get props => [updatedProfile];

  @override
  String toString() => 'UpdateProfile { firstName: $updatedProfile.firstName, lastName: $updatedProfile.lastName }';

}

class ProfileUpdated extends ProfileEvent {
  final Profile updatedProfile;

  const ProfileUpdated(this.updatedProfile);

  @override
  List<Object> get props => [updatedProfile];

  @override
  String toString() => 'ProfileUpdated { firstName: $updatedProfile.firstName, lastName: $updatedProfile.lastName }';
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

