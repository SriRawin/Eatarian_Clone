import 'package:fleska_assignment/Screens/CustomWidgets/AnimatedButton.dart';
import 'package:fleska_assignment/Screens/CustomWidgets/ButtonWithUnderline.dart';
import 'package:fleska_assignment/Utils/responsive_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool hasSearchBar;
  CustomAppBar({required this.hasSearchBar});
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(builder: (context, size) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.canPop(context)
                  ? Navigator.pop(context)
                  : Navigator.pushReplacementNamed(context, '/');
            },
            child: Image.asset(
              "images/logo.webp",
              scale: 1.16,
            ),
          ),
          hasSearchBar
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  width: size.width * 0.28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(
                      size.width * 0.04,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.01,
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Sandweg 131, Frankfurt Germany",
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
          Spacer(),
          ButtonWithUnderline(
            boxWidth: size.width * 0.13,
            isUnderlined: true,
            text: "BECOME A PARTNER",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.024),
            child: ButtonWithUnderline(
              boxWidth: size.width * 0.056,
              isUnderlined: false,
              text: "ENGLISH",
            ),
          ),
          AnimatedButton(
            size: size,
          ),
        ],
      );
    });
  }
}
