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
                    child: _AlbumArt(albumArt: albumArt),
                  ),
                  Hero(
                    tag: "playButton$id",
                    child: const _PlayButton(),
                  ),
                ],
              ),
            ),
            Hero(
              tag: "textInfo$id",
              child: ReleaseTextInfo(
                title: title,
                artist: artist,
                trackCount: tracks.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AlbumArt extends StatelessWidget {
  const _AlbumArt({
    Key? key,
    required this.albumArt,
  }) : super(key: key);

  final String albumArt;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kCornerRadius),
      child: Image.asset(
        albumArt,
        height: 350,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("button clicked");
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerRight,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kAccentGreen,
          boxShadow: [
            kBoxShadow,
          ],
        ),
        child: const Icon(
          Icons.play_arrow_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
