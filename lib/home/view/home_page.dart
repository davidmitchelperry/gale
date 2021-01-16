import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:gale/home/home.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
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
            Avatar(photo: user.photo),
            const SizedBox(height: 4.0),
            Text(user.email, style: textTheme.headline6),
            const SizedBox(height: 4.0),
            Text(user.name ?? '', style: textTheme.headline5),
            SizedBox(height: 25),
            RaisedButton(
              key: const Key('test_raisedButton'),
              child: const Text('TEST'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: const Color(0xFFFFD600),
            ),
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