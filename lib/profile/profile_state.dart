import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart';

abstract class ProfileState extends Equatable {

  //final Future<Profile> profile;
  final String test_text;

  const ProfileState(this.test_text);

  @override
  List<Object> get props => [test_text];
}

class ProfileLoading extends ProfileState {

  const ProfileLoading(String test_text) : super(test_text);

  @override
  List<Object> get props => [test_text];

  @override
  String toString() => 'ProfileLoading { test_text: $test_text }';
}

class ProfileLoaded extends ProfileState {

  const ProfileLoaded(String test_text) : super(test_text);

  @override
  List<Object> get props => [test_text];

  @override
  String toString() => 'ProfileLoaded {test_text: $test_text }';
}

//class ProfileCouldNotLoad extends ProfileState {
//  const ProfileCouldNotLoad()
//}
