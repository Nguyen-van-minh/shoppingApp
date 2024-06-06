import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageCard extends StatelessWidget {
  final String image;
  final double? height;
  final bool isLike;
  final bool isFitImage;
  final bool isHasFavorite;
  Radius borderTopRight;
  Radius borderTopLeft;
  Radius borderBottomRight;
  Radius borderBottomLeft;
  final Alignment buttonHeartAlignment;
  ImageCard(
      {super.key,
      required this.image,
      this.height = 150,
      this.isLike = false,
      this.isFitImage = false,
      this.isHasFavorite = true,
      this.borderBottomLeft = const Radius.circular(10),
      this.borderBottomRight = const Radius.circular(10),
      this.borderTopLeft = const Radius.circular(10),
      this.borderTopRight = const Radius.circular(10),
      this.buttonHeartAlignment = Alignment.topRight});

  @override
  Widget build(BuildContext context) {
    return isFitImage
        ? ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: borderTopLeft,
                topRight: borderTopRight,
                bottomLeft: borderBottomLeft,
                bottomRight: borderBottomRight),
            child: Stack(
              children: [
                Image.asset(
                  'assets/$image',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          )
        : SizedBox(
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: borderTopLeft,
                  topRight: borderTopRight,
                  bottomLeft: borderBottomLeft,
                  bottomRight: borderBottomRight),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/$image',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          );
  }
}
