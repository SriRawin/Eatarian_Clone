import 'package:fleska_assignment/Utils/responsive_template.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imgPath;
  final String title;
  ImageCard({required this.title, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      builder: (context, size) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: size.height * 0.024),
              height: size.height * 0.32,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(2, 4),
                    spreadRadius: 2,
                    blurRadius: 16,
                    color: Colors.black26,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/second");
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: size.height * 0.024,
              ),
            ),
          ],
        );
      },
    );
  }
}
