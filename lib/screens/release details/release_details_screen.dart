import 'dart:ui';

import 'package:flutter/material.dart';

import '../../constraints.dart';
import '../../models/music.dart';
import '../../widgets/release_text_info.dart';
import 'local widgets/release_details_track_tile.dart';

class ReleaseDetails extends StatelessWidget {
  const ReleaseDetails({Key? key}) : super(key: key);

  static const routeName = "/release-details";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments! as Music;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: _BlurredAlbumArt(routeArgs: routeArgs),
            ),
            Center(
              child: Column(
                children: [
                  const Spacer(),
                  _ReleaseInfo(routeArgs: routeArgs),
                  _TrackList(routeArgs: routeArgs),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BlurredAlbumArt extends StatelessWidget {
  const _BlurredAlbumArt({
    Key? key,
    required this.routeArgs,
  }) : super(key: key);

  final Music routeArgs;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(routeArgs.albumArt),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _ReleaseInfo extends StatelessWidget {
  const _ReleaseInfo({
    Key? key,
    required this.routeArgs,
  }) : super(key: key);

  final Music routeArgs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kCornerRadius),
          color: kDarkBackgroundColor),
      width: 300,
      child: ReleaseTextInfo(
          title: routeArgs.title,
          artist: routeArgs.artist,
          trackCount: routeArgs.tracks.length),
    );
  }
}

class _TrackList extends StatelessWidget {
  const _TrackList({
    Key? key,
    required this.routeArgs,
  }) : super(key: key);

  final Music routeArgs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kCornerRadius),
          color: kDarkBackgroundColor),
      height: 400,
      width: 300,
      child: ListView(
        children: [
          ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: routeArgs.tracks.length,
            itemBuilder: (_, index) {
              return TrackTile(routeArgs: routeArgs, index: index);
            },
          ),
        ],
      ),
    );
  }
}
