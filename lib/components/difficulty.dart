import 'package:flutter/material.dart';
import 'star.dart';

class Difficulty extends StatelessWidget {
  final int dificultyLevel;

  const Difficulty({
    required this.dificultyLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Star(dificultyLevel: dificultyLevel, starNumber: 1),
        Star(dificultyLevel: dificultyLevel, starNumber: 2),
        Star(dificultyLevel: dificultyLevel, starNumber: 3),
        Star(dificultyLevel: dificultyLevel, starNumber: 4),
        Star(dificultyLevel: dificultyLevel, starNumber: 5),
      ],
    );
  }
}
