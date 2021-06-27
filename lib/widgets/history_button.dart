import 'package:flutter/material.dart';

import '../constraints.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: 100,
        decoration: BoxDecoration(
          color: Color(0xFF2E2E3E),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          "History",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
