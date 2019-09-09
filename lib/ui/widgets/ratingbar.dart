import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int rating;

  const RatingBar({Key key, this.rating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (f) {
        return Icon(
          rating <= f ? Icons.star_border : Icons.star,
          color: Colors.white,
        );
      }),
    );
  }
}
