import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/authentication/authentication.dart';

//import 'package:gale/chat/view/chat_page.dart';
import 'package:gale/chat/chat.dart';
import 'package:gale/profile/profile.dart';
import 'package:gale/home/home.dart';
import 'package:gale/instagram/instagram.dart';

class HomePage extends StatelessWidget {
  //final _navigatorKey = GlobalKey<NavigatorState>();
  //NavigatorState get _navigator => _navigatorKey.currentState;

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    //final test_text = context.select((ProfileBloc bloc) => bloc.state.profile
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context
                .read<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested()),
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 4.0),
            Text(user.email, style: textTheme.headline6),
            const SizedBox(height: 4.0),
            Text(user.name ?? '', style: textTheme.headline5),
            SizedBox(height: 4.0),
            Text("uid: " + user.id),
            RaisedButton(
                key: const Key('RB_gotoProfile'),
                child: const Text('Goto Profile'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: const Color(0xFFFFD600),
                onPressed: () {
                  Navigator.push(
                    context,
                    ProfilePage.route(),
                  );
                }),
            RaisedButton(
                key: const Key('RB_gotoChat'),
                child: const Text('Goto Chat'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: const Color(0xFFFFD600),
                onPressed: () {
                  Navigator.push(
                    context,
                    ChatNavigatorPage.route(),
                  );
                }),
            RaisedButton(
                key: const Key('RB_gotoInstagram'),
                child: const Text('Goto Instagram'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: const Color(0xFFFFD600),
                onPressed: () {
                  Navigator.push(
                    context,
                    InstagramPage.route(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

//class _LoginButton extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return BlocBuilder<LoginCubit, LoginState>(
//      buildWhen: (previous, current) => previous.status != current.status,
//      builder: (context, state) {
//        return state.status.isSubmissionInProgress
//            ? const CircularProgressIndicator()
//            : RaisedButton(
//          key: const Key('loginForm_continue_raisedButton'),
//          child: const Text('LOGIN'),
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(30.0),
//          ),
//          color: const Color(0xFFFFD600),
//          onPressed: state.status.isValidated
//              ? () => context.read<LoginCubit>().logInWithCredentials()
//              : null,
//        );
//      },
//    );
//  }
//}
//
