import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:x_release/services/models/follows.dart';

class Spotify {
  Future<void> fetchFollows(String token) async {
    const String followsApi =
        'https://api.spotify.com/v1/me/following?type=artist&limit=50';
    const String fireBaseUrl =
        'https://x-releases-default-rtdb.firebaseio.com/follows.json';

    final response = await http.get(Uri.parse(followsApi),
        headers: {"Authorization": "Bearer $token"});

    if (response.statusCode == 200) {
      print("Reponse OK");
      final url = Uri.parse(fireBaseUrl);
      http.post(url, body: response.body);
      final parsed = jsonDecode(response.body) as Map<String, dynamic>;
      final follows =
          parsed.map<Follows>((json) => Follows.fromJson(json)).toList();
      print(follows);
      // for (final artist in artists.items!) {
      //   if (artist != null) {
      //     print(artist.name);
      //   }
      // }
    } else {
      print("Status code: $response.statusCode");
      print("Status message: $response.message");
    }
  }

  Future<String> getAuthenticationToken() async {
    try {
      final authenticationToken = await SpotifySdk.getAuthenticationToken(
        clientId: "213cb7136ae14b5fb767ee0da2be38ae",
        redirectUrl: "https://www.google.com",
        scope: "playlist-read-private, user-follow-read",
      );
      print('Got a token: $authenticationToken');
      return authenticationToken;
    } on PlatformException catch (e) {
      print(e.code + e.message!);
      return Future.error('$e.code: $e.message');
    } on MissingPluginException {
      print('not implemented');
      return Future.error('not implemented');
    }
  }
}
