import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:x_release/services/models/follows/follows.dart';
import 'package:x_release/services/models/albums/albums.dart';

class Spotify {
  // gets a single artists releases
  static Future<void> getArtistReleases(String token, String id) async {
    final String endpoint = "https://api.spotify.com/v1/artists/$id/albums";
    final albumList = [];

    final response = await http
        .get(Uri.parse(endpoint), headers: {"Authorization": "Bearer $token"});
    final parsedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final albums = Albums.fromJson(parsedResponse);

    if (response.statusCode == 200) {
      for (final album in albums.items ?? []) {
        albumList.add({
          "id": album.id,
          "name": album.name,
          "release_date": album.releaseDate,
          "total_tracks": album.totalTracks,
          "type": album.type,
          "images": album.images,
        });
      }
    } else {
      throw "Reponse returned with error ${response.statusCode}: ${response.body}";
    }
    print(albumList);
  }

  static Future<void> postArtists(List<dynamic> artistList) async {
    const String fireBaseUrl =
        'https://x-releases-default-rtdb.firebaseio.com/follows.json';

    final response =
        await http.post(Uri.parse(fireBaseUrl), body: json.encode(artistList));
    print("Status code: ${response.statusCode}");
    print("Status message: ${response.body}");
  }

  static Future<List<dynamic>> getFollows(String token) async {
    const int requestLimit = 50;
    const String endpoint =
        'https://api.spotify.com/v1/me/following?type=artist&limit=$requestLimit';
    final artistList = [];
    var afterParameter = "";

    do {
      final response = await http.get(Uri.parse(endpoint + afterParameter),
          headers: {"Authorization": "Bearer $token"});
      final parsedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final userFollows = Follows.fromJson(parsedResponse);

      if (response.statusCode == 200) {
        for (final artist in userFollows.artists!.items ?? []) {
          artistList.add({"id": artist.id, "name": artist.name});
        }
      } else {
        throw "Reponse returned with error ${response.statusCode}: ${response.body}";
      }
      // defines after which artist to start getting new response from
      afterParameter =
          "&after=${artistList[artistList.length - 1]["id"].toString()}";
    } while (artistList.length % requestLimit == 0);

    return artistList;
  }

  static Future<String> getAuthenticationToken() async {
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
