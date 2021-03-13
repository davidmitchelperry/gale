import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart';

abstract class ProfileState extends Equatable {
  final String userid;

  const ProfileState(this.userid);

  @override
  List<Object> get props => [userid];
}

class ProfileLoading extends ProfileState {
  const ProfileLoading(String userid) : super(userid);

  @override
  List<Object> get props => [userid];

  @override
  String toString() => 'ProfileLoading { userid: $userid }';
}

class ProfileLoaded extends ProfileState {
  final Profile profile;

  const ProfileLoaded(String userid, this.profile) : super(userid);

  @override
  List<Object> get props => [profile];

  @override
  String toString() => 'ProfileLoaded {profile: $profile }';
}
