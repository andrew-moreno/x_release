import 'package:flutter/material.dart';
import 'package:x_release/widgets/release_text_info.dart';

import '../../../constraints.dart';
import '../../../models/music.dart';

class ReleaseCard extends StatelessWidget {
  const ReleaseCard({
    Key? key,
    required this.id,
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.tracks,
  }) : super(key: key);

  final int id;
  final String title;
  final String artist;
  final String albumArt;
  final List<String> tracks;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            "/release-details",
            arguments: Music(
                id: id,
                title: title,
                artist: artist,
                albumArt: albumArt,
                releaseDate: "null",
                tracks: tracks),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              margin: const EdgeInsets.symmetric(vertical: 9),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kCornerRadius),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(albumArt),
                ),
              ),
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  print("button clicked");
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerRight,
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kAccentGreen,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ReleaseTextInfo(
                title: title, artist: artist, trackCount: tracks.length)
          ],
        ),
      ),
    );
  }
}
