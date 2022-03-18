import 'package:fleska_assignment/Utils/Constants.dart';
import 'package:fleska_assignment/Utils/responsive_template.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final String description;
  InfoCard(
      {required this.title, required this.description, required this.iconPath});
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(builder: (context, size) {
      return Column(
        children: [
          SizedBox(
            width: size.width * 0.12,
            child: Image.asset(iconPath),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.03,
              bottom: size.height * 0.05,
            ),
            child: Text(
              title,
              style: subHeader.copyWith(
                fontSize: size.height * 0.032,
              ),
            ),
          ),
          Text(
            description,
            softWrap: true,
            textAlign: TextAlign.center,
            style: paragraph,
          ),
        ],
      );
    });
  }
}
