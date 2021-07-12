import 'package:flutter/material.dart';

import '../../constraints.dart';

class HistoryHeader extends StatelessWidget {
  const HistoryHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2E2E3E),
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        "History",
        style:
            Theme.of(context).textTheme.headline4!.copyWith(color: kAccentRed),
      ),
    );
  }
}
