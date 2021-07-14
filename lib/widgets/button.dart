import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.route,
    required this.width,
    required this.text,
  }) : super(key: key);

  final String route;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          route,
        );
      },
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xFF2E2E3E),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontFamily: "DMSans",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
