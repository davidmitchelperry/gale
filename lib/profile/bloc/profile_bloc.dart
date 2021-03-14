import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:meta/meta.dart';
import 'package:gale/profile/profile.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc({
    @required ProfileRepository profileRepository,
    @required AuthenticationRepository authenticationRepository,
  })  : assert(profileRepository != null),
        _profileRepository = profileRepository,
        super(ProfileInit());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      yield* _mapLoadProfileToState(event);
    } else if (event is LoadProfileComplete) {
      yield* _mapLoadProfileCompleteToState(event);
    }
  }

  Stream<ProfileState> _mapLoadProfileToState(LoadProfile event) async* {
    yield ProfileLoading(event.userid);
    _profileRepository.readProfile(event.userid).then((Profile profile) {
      add(LoadProfileComplete(event.userid, profile));
    }, onError: (e) {});
  }

  Stream<ProfileState> _mapLoadProfileCompleteToState(
      LoadProfileComplete event) async* {
    yield ProfileLoaded(event.userid, event.profile);
  }

  //Stream<ProfileState> _mapCreateProfileToState(CreateProfile event) async* {
  //  _profileRepository.createNewProfile(event.profile, event.user);
  //}

  //Stream<ProfileState> _mapUpdateProfileToState(UpdateProfile event) async* {
  //  _profileRepository.updateProfile(event.profile, event.user);
  //}


}
