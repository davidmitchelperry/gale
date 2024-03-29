import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gale/authentication/authentication.dart';
import 'package:gale/profile/profile.dart';
import 'package:gale/instagram/instagram.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// TODO: Probably not a good idea to touch repos in views. Should handle all that in BLoC code?
import 'package:profile_repository/profile_repository.dart';
import 'package:instagram_repository/instagram_repository.dart';

class InstagramPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => InstagramPage());
  }

  @override
  Widget build(BuildContext context) {
    // INIT THE INSTAGRAM CLASS
    final InstagramRepository instagram = context.select(
        (InstagramBloc bloc) => bloc.instagramRepository); // INIT THE WEBVIEW
    final flutterWebviewPlugin =
        new FlutterWebviewPlugin(); // OPEN WEBVIEW ACCORDING TO URL GIVEN
    flutterWebviewPlugin.launch(InstagramRepository.url); // LISTEN CHANGES
    flutterWebviewPlugin.onUrlChanged.listen((String url) async {
      // IF SUCCESS LOGIN
      if (url.contains(InstagramRepository.redirectUri)) {
        instagram.getAuthorizationCode(url);
        instagram.getTokenAndUserID().then((isDone) {
          if (isDone) {
            instagram.getUserProfile().then((isDone) {
              instagram.getAllMedias().then((mds) {
                var medias = mds; // NOW WE CAN CLOSE THE WEBVIEW
                flutterWebviewPlugin
                    .close(); // WE PUSH A NEW ROUTE FOR SELECTING OUR MEDIAS
                //Navigator.of(context)
                //    .push(MaterialPageRoute(builder: (BuildContext ctx) {
                //  // ADDING OUR SELECTION PAGE
                //  return InstagramSelectionPage(
                //    medias: medias,
                //    onPressedConfirmation: () {
                //      // RETURNING AFTER SELECTION OUR MEDIAS LIST
                //      Navigator.of(ctx).pop();
                //      Navigator.of(context).pop(medias);
                //    },
                //  );
                //}));
              });
            });
          }
        });
      }
    });

    return WebviewScaffold(
      resizeToAvoidBottomInset: true,
      url: InstagramRepository.url,
      appBar: AppBar(
        leading: IconButton(
            //icon: iBack,
            onPressed: () {
          //Navigator.of(context).pop(medias);
        }),
        //title: MyText(
        //  data: lConnectingToInstagram,
        //  fontWeight: FontWeight.bold,
        //  color: white,
        //),
        //backgroundColor: pointer,
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }

  //@override
  //Widget build(BuildContext context) {
  //  final textTheme = Theme.of(context).textTheme;
  //  final authInfo =
  //      context.select((AuthenticationBloc bloc) => bloc.state.user);
  //  final helloWorld =
  //      context.select((InstagramBloc bloc) => bloc.state.helloWorld);

  //  return Scaffold(
  //    appBar: AppBar(
  //      title: const Text('Instagram'),
  //      actions: <Widget>[
  //        IconButton(
  //          key: const Key('instagramPage_logout_iconButton'),
  //          icon: const Icon(Icons.exit_to_app),
  //          onPressed: () => context
  //              .read<AuthenticationBloc>()
  //              .add(AuthenticationLogoutRequested()),
  //        )
  //      ],
  //    ),
  //    body: Align(
  //      alignment: const Alignment(0, -1 / 3),
  //      child: Column(
  //        mainAxisSize: MainAxisSize.min,
  //        children: <Widget>[
  //          Text(helloWorld),
  //          RaisedButton(
  //              child: const Text('Go to Consent Page'),
  //              color: Colors.blue,
  //              onPressed: (() {
  //                var flutterWebViewPlugin = new FlutterWebviewPlugin();
  //                flutterWebViewPlugin.launch("www.google.com");
  //              }),
  //          //BlocBuilder<ProfileBloc, ProfileState>(
  //          //  builder: (context, state) {
  //          //    return Text(
  //          //      "STATE: " + state.toString(),
  //          //      key: const Key('T_currentProfile'),
  //          //      textAlign: TextAlign.left,
  //          //    );
  //          //  },
  //          //),
  //          //RaisedButton(
  //          //  child: const Text('Load userid1'),
  //          //  color: Colors.blue,
  //          //  onPressed: () =>
  //          //      context.read<ProfileBloc>().add(LoadProfile('userid1')),
  //          //),
  //          //RaisedButton(
  //          //  child: const Text('Load userid2'),
  //          //  color: Colors.blue,
  //          //  onPressed: () =>
  //          //      context.read<ProfileBloc>().add(LoadProfile('userid2')),
  //          //),
  //        ],
  //      ),
  //    ),
  //  );
  //}
}
