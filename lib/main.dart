import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gale/app.dart';
import 'package:gale/simple_bloc_observer.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:instagram_repository/instagram_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    profileRepository: FirebaseProfileRepository(),
    chatRepository: FirebaseChatRepository(),
    instagramRepository: InstagramRepository(),
  ));
}
