import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final int dificultyLevel;
  final int starNumber;

  const Star({
    Key? key,
    required this.dificultyLevel,
    required this.starNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blue = Colors.blue;
    var lightBlue = Colors.blue[100];
    var validateDifficuty = dificultyLevel >= starNumber;

    return Icon(
      Icons.star,
      size: 15,
      color: (validateDifficuty) ? blue : lightBlue,
    );
  }
}
