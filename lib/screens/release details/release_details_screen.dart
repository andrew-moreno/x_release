import 'package:flutter/material.dart';

import '../../constraints.dart';
import '../../widgets/release_text_info.dart';
import 'local widgets/release_details_track_tile.dart';

class ReleaseDetails extends StatelessWidget {
  const ReleaseDetails({
    Key? key,
    required this.id,
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.releaseDate,
    required this.tracks,
  }) : super(key: key);

  final int id;
  final String title;
  final String artist;
  final String albumArt;
  final String releaseDate;
  final List<String> tracks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor:
                  kDarkBackgroundColor, // weird blue line appears underneath if not included
              elevation: 100,
              collapsedHeight: MediaQuery.of(context).size.width / 2,
              expandedHeight: MediaQuery.of(context).size.width,
              flexibleSpace: Stack(
                children: [
                  Positioned.fill(
                    child: Hero(
                      tag: "albumArt$id",
                      child: Image.asset(
                        albumArt,
                        height: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Hero(
                      tag: "playButton$id",
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
                    ),
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 50,
                    ),
                    child: Column(
                      children: [
                        Hero(
                          tag: "textInfo$id",
                          child: ReleaseTextInfo(
                            title: title,
                            artist: artist,
                            trackCount: tracks.length,
                          ),
                        ),
                        const Divider(
                          height: 20,
                          color: Color(0x00000000),
                        ),
                        ListView.separated(
                          separatorBuilder: (_, index) => const Divider(
                            height: 15,
                            color: Color(0x00000000),
                          ),
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: tracks.length,
                          itemBuilder: (_, index) {
                            return TrackTile(tracks: tracks, index: index);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
