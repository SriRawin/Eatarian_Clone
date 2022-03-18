import 'package:fleska_assignment/Screens/CustomWidgets/CustomAppBar.dart';
import 'package:fleska_assignment/Utils/Constants.dart';
import 'package:fleska_assignment/Utils/responsive_template.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(builder: (context, size) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                      vertical: size.height * 0.02),
                  height: size.height * 0.1,
                  child: CustomAppBar(
                    hasSearchBar: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: size.height * 0.06,
                          width: size.width * 0.4,
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                            horizontal: size.width * 0.01,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              Text(
                                "Search by meal type",
                                style: paragraph.copyWith(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.height * 0.02,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.8,
                          width: size.width * 0.44,
                          child: Scaffold(
                            appBar: TabBar(
                              tabs: [
                                Tab(
                                  child: CustomLabel(
                                    title: "DELIVERY",
                                    iconPath: "images/icon/delivery.png",
                                  ),
                                ),
                                Tab(
                                  child: CustomLabel(
                                    title: "PICKUP",
                                    iconPath: "images/icon/pickup.png",
                                  ),
                                ),
                              ],
                            ),
                            body: TabBarView(
                              children: [
                                NoDataFound(),
                                NoDataFound(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.9,
                      width: size.width * 0.56,
                      child: Image.asset(
                        "images/misc/sample.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class CustomLabel extends StatelessWidget {
  final String iconPath;
  final String title;
  CustomLabel({required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 29,
          child: Image.asset(iconPath),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: subHeader.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class NoDataFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Image.asset(
            "images/icon/map.png",
            color: Colors.grey,
          ),
        ),
        Text(
          "0 results match your search.",
          style: subHeader.copyWith(
            color: Colors.grey,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Please enter another search.",
          style: paragraph.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
