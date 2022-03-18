import 'package:fleska_assignment/Utils/responsive_template.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  double? cardHeight;
  double? cardWidth;
  final String title;
  final String imgPath;
  LocationCard(
      {this.cardHeight,
      this.cardWidth,
      required this.imgPath,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      builder: (context, size) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: cardHeight,
                width: cardWidth,
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: cardWidth,
                height: 60,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: size.height * 0.028,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
