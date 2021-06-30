import 'package:flutter/material.dart';

import '../../constraints.dart';

class ReleaseInfo extends StatelessWidget {
  const ReleaseInfo({
    Key? key,
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.trackCount,
  }) : super(key: key);

  final String title;
  final String artist;
  final String albumArt;
  final int trackCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350,
            margin: const EdgeInsets.symmetric(vertical: 9),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(albumArt),
              ),
            ),
            alignment: Alignment.bottomRight,
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
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: 27, height: 1.3),
          ),
          Text(
            artist,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontSize: 18, height: 1.3),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              children: [
                _buildInfoContainer("Album", kAccentBlue),
                _buildInfoContainer(trackCount.toString(), kAccentPurple)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Container _buildInfoContainer(String text, Color color) {
  return Container(
    margin: const EdgeInsets.only(right: 15),
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: color,
    ),
    child: Text(
      text,
      style:
          const TextStyle(fontFamily: "DM_Sans", fontWeight: FontWeight.w700),
    ),
  );
}
