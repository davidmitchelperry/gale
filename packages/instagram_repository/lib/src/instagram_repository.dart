// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:instagram_repository/instagram_repository.dart';

class InstagramRepository {
  // [clientID], [appSecret], [redirectUri] from your facebook developer basic display panel.
  // [scope] choose what kind of data you're wishing to get.
  // [responseType] I recommend only 'code', I try on DEV MODE with token, it wasn't working.
  // [url] simply the url used to communicate with Instagram API at the beginning.
  static const String clientID = "860843208094582";
  static const String appSecret = "fd786307df2f5b28d725534f8cc90165";
  static const String redirectUri = 'https://www.davidmitchelperry.com/auth/';
  static const String scope = 'user_profile,user_media';
  static const String responseType = 'code';
  static const String url =
      'https://api.instagram.com/oauth/authorize?client_id=${clientID}&redirect_uri=${redirectUri}&scope=${scope}&response_type=${responseType}';
  // Presets your required fields on each call api.
  // Please refers to https://developers.facebook.com/docs/instagram-basic-display-api/reference .
  List<String> userFields = ['id', 'username'];
  List<String> mediasListFields = ['id', 'caption'];
  List<String> mediaFields = [
    'id',
    'media_type',
    'media_url',
    'username',
    'timestamp'
  ];

  String authorizationCode;
  String accessToken;
  String userID;
  Map<String, String> instaProfile;
  List<InstaMedia> medias;

  // TODO: int get/set authorizationCode
  void getAuthorizationCode(String url) {
    /// Parsing the code from string url.
    authorizationCode =
        url.replaceAll('${redirectUri}?code=', '').replaceAll('#_', '');
  }

  Future<bool> getTokenAndUserID() async {
    /// Request token.
    /// Set token.
    /// Returning status request as bool.
    final http.Response response =
        await http.post("https://api.instagram.com/oauth/access_token", body: {
      "client_id": clientID,
      "redirect_uri": redirectUri,
      "client_secret": appSecret,
      "code": authorizationCode,
      "grant_type": "authorization_code"
    });
    accessToken = json.decode(response.body)['access_token'];
    userID = json.decode(response.body)['user_id'].toString();
    return (accessToken != null && userID != null) ? true : false;
  }

  Future<bool> getUserProfile() async {
    /// Parse according fieldsList.
    /// Request instagram user profile.
    /// Set profile.
    /// Returning status request as bool.
    final String fields = userFields.join(',');
    final http.Response responseNode = await http.get(
        'https://graph.instagram.com/${userID}?fields=${fields}&access_token=${accessToken}');
    instaProfile = {
      'id': json.decode(responseNode.body)['id'].toString(),
      'username': json.decode(responseNode.body)['username'],
    };
    return (instaProfile != null) ? true : false;
  }

  Future<List<InstaMedia>> getAllMedias() async {
    /// Parse according fieldsList.
    /// Request instagram user medias list.
    /// Request for each media id the details.
    /// Set all medias as list Object.
    /// Returning the List<InstaMedia>.
    final String fields = mediasListFields.join(',');
    final http.Response responseMedia = await http.get(
        'https://graph.instagram.com/${userID}/media?fields=${fields}&access_token=${accessToken}');
    Map<String, dynamic> mediasList = json.decode(responseMedia.body);
    medias = [];
    await mediasList['data'].forEach((media) async {
      // check inside db if exists (optional)
      Map<String, dynamic> m = await getMediaDetails(media['id']);
      InstaMedia instaMedia = InstaMedia(m);
      medias.add(instaMedia);
    });
    // need delay before returning the List<InstaMedia>
    await Future.delayed(Duration(seconds: 1), () {});
    return medias;
  }

  Future<Map<String, dynamic>> getMediaDetails(String mediaID) async {
    /// Parse according fieldsList.
    /// Request complete media informations.
    /// Returning the response as Map<String, dynamic>
    final String fields = mediaFields.join(',');
    final http.Response responseMediaSingle = await http.get(
        'https://graph.instagram.com/${mediaID}?fields=${fields}&access_token=${accessToken}');
    return json.decode(responseMediaSingle.body);
  }

  String helloWorld() {
    return "helloWorld";
  }
}
