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
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0),
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
                        _TrackList(
                          tracks: tracks,
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

class _TrackList extends StatelessWidget {
  const _TrackList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  final List<String> tracks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: tracks.length,
      itemBuilder: (_, index) {
        return TrackTile(tracks: tracks, index: index);
      },
    );
  }
}

// import 'dart:ui';

// import 'package:flutter/material.dart';

// import '../../constraints.dart';
// import '../../widgets/release_text_info.dart';
// import 'local widgets/release_details_track_tile.dart';

// class ReleaseDetailsDiff extends StatelessWidget {
//   const ReleaseDetailsDiff({
//     Key? key,
//     required this.id,
//     required this.title,
//     required this.artist,
//     required this.albumArt,
//     required this.releaseDate,
//     required this.tracks,
//   }) : super(key: key);

//   final int id;
//   final String title;
//   final String artist;
//   final String albumArt;
//   final String releaseDate;
//   final List<String> tracks;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: _BlurredAlbumArt(id: id, albumArt: albumArt),
//             ),
//             Center(
//               child: Column(
//                 children: [
//                   const Spacer(),
//                   _ReleaseInfo(
//                     title: title,
//                     artist: artist,
//                     tracks: tracks,
//                   ),
//                   _TrackList(tracks: tracks),
//                   const Spacer(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _BlurredAlbumArt extends StatelessWidget {
//   const _BlurredAlbumArt({
//     Key? key,
//     required this.id,
//     required this.albumArt,
//   }) : super(key: key);

//   final int id;
//   final String albumArt;

//   @override
//   Widget build(BuildContext context) {
//     return ImageFiltered(
//       imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
//       child: Image.asset(
//         albumArt,
//         height: MediaQuery.of(context).size.height,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

// class _ReleaseInfo extends StatelessWidget {
//   const _ReleaseInfo({
//     Key? key,
//     required this.title,
//     required this.artist,
//     required this.tracks,
//   }) : super(key: key);

//   final String title;
//   final String artist;
//   final List<String> tracks;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(
//         bottom: 20,
//       ),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(kCornerRadius),
//           color: kDarkBackgroundColor),
//       width: 300,
//       child: ReleaseTextInfo(
//           title: title, artist: artist, trackCount: tracks.length),
//     );
//   }
// }

// class _TrackList extends StatelessWidget {
//   const _TrackList({
//     Key? key,
//     required this.tracks,
//   }) : super(key: key);

//   final List<String> tracks;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(kCornerRadius),
//           color: kDarkBackgroundColor),
//       height: 400,
//       width: 300,
//       child: ListView(
//         children: [
//           ListView.builder(
//             physics: const ScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: tracks.length,
//             itemBuilder: (_, index) {
//               return TrackTile(tracks: tracks, index: index);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
