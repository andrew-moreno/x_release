import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    Key? key,
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.releaseDate,
  }) : super(key: key);

  final String title;
  final String artist;
  final String albumArt;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _AlbumArt(albumArt: albumArt),
        _TextInfo(title: title, artist: artist),
        const Spacer(),
        _ReleaseDate(releaseDate: releaseDate),
      ],
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
      borderRadius: BorderRadius.circular(7),
      child: Image.asset(
        albumArt,
        height: 50,
      ),
    );
  }
}

class _TextInfo extends StatelessWidget {
  const _TextInfo({
    Key? key,
    required this.title,
    required this.artist,
  }) : super(key: key);

  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontFamily: "DMSans",
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
          Text(
            artist,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontFamily: "DMSans",
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _ReleaseDate extends StatelessWidget {
  const _ReleaseDate({
    Key? key,
    required this.releaseDate,
  }) : super(key: key);

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Text(
      releaseDate.toString(),
      style: const TextStyle(
          fontFamily: "DMSans",
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.grey),
    );
  }
}
