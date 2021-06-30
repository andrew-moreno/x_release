import 'package:flutter/material.dart';

class HistoryReleaseTile extends StatelessWidget {
  const HistoryReleaseTile({
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
        ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Image.asset(
            albumArt,
            height: 50,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontFamily: "DMSans",
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Text(
                artist,
                style: const TextStyle(
                    fontFamily: "DMSans",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text(
          releaseDate.toString(),
          style: const TextStyle(
              fontFamily: "DMSans",
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey),
        ),
      ],
    );
  }
}
