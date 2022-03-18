import 'package:fleska_assignment/Screens/CustomWidgets/CustomAppBar.dart';
import 'package:fleska_assignment/Utils/Constants.dart';
import 'package:fleska_assignment/Utils/responsive_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(builder: (context, size) {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.028,
          horizontal: size.width * 0.018,
        ),
        color: KprimaryYellow,
        child: Column(
          children: [
            CustomAppBar(
              hasSearchBar: false,
            ),
            Spacer(),
          ],
        ),
      );
    });
  }
}
