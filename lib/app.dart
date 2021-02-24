import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:gale/chat/bloc/chat_bloc.dart';
import 'package:gale/profile/profile.dart';
import 'package:gale/home/home.dart';
import 'package:gale/login/login.dart';
import 'package:gale/splash/splash.dart';
import 'package:gale/theme.dart';
import 'package:gale/todos/todos.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:profile_repository/profile_repository.dart';

class App extends StatelessWidget {

  const App({
    Key key,
    @required this.authenticationRepository,
    @required this.todosRepository,
    @required this.profileRepository,
    @required this.chatRepository,
  })  : assert(authenticationRepository != null),
        assert(todosRepository != null),
        assert(profileRepository != null),
        assert(chatRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;
  final TodosRepository todosRepository;
  final ProfileRepository profileRepository;
  final ChatRepository chatRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
            value: authenticationRepository,
        ),
        RepositoryProvider.value(
            value: todosRepository,
        ),
        RepositoryProvider.value(
          value: profileRepository,
        ),
        RepositoryProvider.value(
          value: chatRepository,
        ),
      ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc> (
              create: (_) => AuthenticationBloc(
                authenticationRepository: authenticationRepository,
              ),
            ),
            BlocProvider<TodosBloc> (
              create: (_) => TodosBloc(
                todosRepository: todosRepository,
              ),
            ),
            BlocProvider<ProfileBloc> (
              create: (_) => ProfileBloc(
                profileRepository: profileRepository,
              ),
            ),
            BlocProvider<ChatBloc> (
              create: (_) => ChatBloc(
                chatRepository: chatRepository,
                authenticationRepository: authenticationRepository,
              )
            )
          ],
          child: AppView(),
          //child: Text("test"),
        ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {

  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
