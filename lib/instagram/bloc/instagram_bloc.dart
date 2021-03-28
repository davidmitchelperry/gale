import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:gale/instagram/instagram.dart';
import 'package:meta/meta.dart';
import 'package:gale/profile/profile.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:instagram_repository/instagram_repository.dart';

class InstagramBloc extends Bloc<InstagramEvent, InstagramState> {
  final InstagramRepository _instagramRepository;

  InstagramBloc({
    @required InstagramRepository instagramRepository,
  })  : assert(instagramRepository != null),
        _instagramRepository = instagramRepository,
        super(InstagramInit(instagramRepository.helloWorld()));

  //final ProfileRepository _profileRepository;
  //InstagramBloc({
  //  @required ProfileRepository profileRepository,
  //  @required AuthenticationRepository authenticationRepository,
  //})  : assert(profileRepository != null),
  //      _profileRepository = profileRepository,
  //      super(ProfileInit());

  @override
  Stream<InstagramState> mapEventToState(InstagramEvent event) async* {
    //if (event is LoadProfile) {
    //  yield* _mapLoadProfileToState(event);
    //} else if (event is LoadProfileComplete) {
    //  yield* _mapLoadProfileCompleteToState(event);
    //}
  }

  Stream<InstagramState> _mapLoadProfileToState(LoadProfile event) async* {
    //yield ProfileLoading(event.userid);
    //_profileRepository.readProfile(event.userid).then((Profile profile) {
    //  add(LoadProfileComplete(event.userid, profile));
    //}, onError: (e) {});
  }

  //Stream<InstagramState> _mapLoadProfileCompleteToState(
  //    LoadProfileComplete event) async* {
  //  yield ProfileLoaded(event.userid, event.profile);
  //}

//Stream<InstagramState> _mapCreateProfileToState(CreateProfile event) async* {
//  _profileRepository.createNewProfile(event.profile, event.user);
//}

//Stream<InstagramState> _mapUpdateProfileToState(UpdateProfile event) async* {
//  _profileRepository.updateProfile(event.profile, event.user);
//}

}
