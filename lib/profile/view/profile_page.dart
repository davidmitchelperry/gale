import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:gale/profile/profile.dart';

// TODO: Probably not a good idea to touch repos in views. Should handle all that in BLoC code?
import 'package:profile_repository/profile_repository.dart';

class ProfilePage extends StatelessWidget {

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    //final test_text = context.select((ProfileBloc bloc) => bloc.state.profile
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: <Widget>[
          IconButton(
            key: const Key('profilePage_logout_iconButton'),
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
            SizedBox(height: 4.0),
            Text("uid: " + user.id),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return Text(
                  state.test_text,
                  key: const Key('T_currentProfile'),
                  textAlign: TextAlign.center,
                );
              },
            ),
            RaisedButton(
              key: const Key('RB_createProfile'),
              child: const Text('createProfile'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: const Color(0xFFFFD600),
              onPressed: () => context
                  .read<ProfileBloc>()
                  .add(CreateProfile(Profile("David", "Perry"), user)),
            ),
            RaisedButton(
              key: const Key('RB_updateProfile'),
              child: const Text('updateProfile'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: const Color(0xFFFFD600),
              onPressed: () => context
                  .read<ProfileBloc>()
                  .add(UpdateProfile(Profile("John", "Smith"), user)),
            ),
            RaisedButton(
              key: const Key('RB_readProfile'),
              child: const Text('readProfile'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: const Color(0xFFFFD600),
              onPressed: () => context
                  .read<ProfileBloc>()
                  .add(ReadProfile('userid1')),
            ),
          ],
        ),
      ),
    );
  }
}
