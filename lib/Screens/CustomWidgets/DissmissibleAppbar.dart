import 'package:fleska_assignment/Screens/CustomWidgets/ButtonWithUnderline.dart';
import 'package:fleska_assignment/Utils/Constants.dart';
import 'package:fleska_assignment/Utils/responsive_template.dart';
import 'package:flutter/material.dart';

class DismissibleAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(builder: (context, size) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.02,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Image.asset("images/logo.webp"),
              width: size.width * 0.1,
            ),
            Container(
              width: size.width * 0.34,
              decoration: BoxDecoration(
                color: KyelloLite,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
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
                      child: Text(
                        "Sandweg 131, Frankfurt Germany",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtonWithUnderline(
              boxWidth: size.width * 0.05,
              isUnderlined: true,
              text: "LOGIN",
            ),
          ],
        ),
      );
    });
  }
}
