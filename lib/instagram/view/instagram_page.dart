import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:gale/profile/profile.dart';
import 'package:gale/instagram/instagram.dart';

// TODO: Probably not a good idea to touch repos in views. Should handle all that in BLoC code?
import 'package:profile_repository/profile_repository.dart';

class InstagramPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => InstagramPage());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final authInfo =
        context.select((AuthenticationBloc bloc) => bloc.state.user);
    final helloWorld =
        context.select((InstagramBloc bloc) => bloc.state.helloWorld);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        actions: <Widget>[
          IconButton(
            key: const Key('instagramPage_logout_iconButton'),
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
            Text(helloWorld),
            //BlocBuilder<ProfileBloc, ProfileState>(
            //  builder: (context, state) {
            //    return Text(
            //      "STATE: " + state.toString(),
            //      key: const Key('T_currentProfile'),
            //      textAlign: TextAlign.left,
            //    );
            //  },
            //),
            //RaisedButton(
            //  child: const Text('Load userid1'),
            //  color: Colors.blue,
            //  onPressed: () =>
            //      context.read<ProfileBloc>().add(LoadProfile('userid1')),
            //),
            //RaisedButton(
            //  child: const Text('Load userid2'),
            //  color: Colors.blue,
            //  onPressed: () =>
            //      context.read<ProfileBloc>().add(LoadProfile('userid2')),
            //),
          ],
        ),
      ),
    );
  }
}
