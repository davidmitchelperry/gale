import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInit extends ProfileState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ProfileInit { }';
}

class ProfileLoading extends ProfileState {
  final String userid;

  const ProfileLoading(this.userid) : super();

  @override
  List<Object> get props => [userid];

  @override
  String toString() => 'ProfileLoading { userid: $userid }';
}

class ProfileLoaded extends ProfileState {
  final String userid;
  final Profile profile;

  const ProfileLoaded(this.userid, this.profile) : super();

  @override
  List<Object> get props => [profile];

  @override
  String toString() => 'ProfileLoaded {profile: $profile }';
}
