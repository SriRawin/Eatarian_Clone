import 'package:fleska_assignment/Utils/Constants.dart';
import 'package:fleska_assignment/Utils/responsive_template.dart';
import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  final SizeInfo size;
  final String title;
  final String content;
  final String iconPath;
  DownloadButton(
      {required this.size,
      required this.iconPath,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: size.height * 0.08,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.01,
          vertical: size.height * 0.007,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.02,
              child: Image.asset(
                iconPath,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: paragraph.copyWith(
                    color: Colors.white,
                    fontSize: size.height * 0.018,
                  ),
                ),
                Text(
                  content,
                  style: subHeader.copyWith(
                    color: Colors.white,
                    fontSize: size.height * 0.024,
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
