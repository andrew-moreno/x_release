import 'package:flutter/material.dart';
import 'package:x_release/screens/release%20details/release_details_screen.dart';
import 'package:x_release/widgets/release_text_info.dart';

import '../../../constraints.dart';

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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ReleaseDetails(
                id: id,
                title: title,
                artist: artist,
                albumArt: albumArt,
                tracks: tracks,
                releaseDate: "null",
              ),
            ),
          );
        },
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 9),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Hero(
                    tag: "albumArt$id",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kCornerRadius),
                      child: Image.asset(
                        albumArt,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Hero(
                    tag: "playButton$id",
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(8),
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
                ],
              ),
            ),
            Hero(
              tag: "textInfo$id",
              child: ReleaseTextInfo(
                  title: title, artist: artist, trackCount: tracks.length),
            ),
          ],
        ),
      ),
    );
  }
}
