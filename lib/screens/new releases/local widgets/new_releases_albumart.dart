import 'package:flutter/material.dart';

import '../../../constraints.dart';

class AlbumArt extends StatelessWidget {
  const AlbumArt({Key? key, required this.albumArt}) : super(key: key);

  final String albumArt;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const _PlayButton(),
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
