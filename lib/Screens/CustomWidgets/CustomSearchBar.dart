import 'package:fleska_assignment/Screens/MapPage.dart';
import 'package:fleska_assignment/Utils/Constants.dart';
import 'package:fleska_assignment/Utils/responsive_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(builder: (context, size) {
      double buttonHeight = size.height * 0.076;
      double buttonWidth = size.width * 0.08;
      return Container(
        width: size.width * 0.5,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(1, 2),
              spreadRadius: 0,
              blurRadius: 20,
              color: Colors.black26,
            ),
          ],
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
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.01,
                ),
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.black87,
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                color: KprimaryYellow,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapPage(),
                      ),
                    );
                  },
                  splashColor: Colors.transparent,
                  child: Container(
                    height: buttonHeight,
                    width: buttonWidth,
                    decoration: gradientButtonDecoration,
                    child: Center(
                      child: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.height * 0.022,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
