import 'package:fleska_assignment/Screens/CustomWidgets/CustomSearchBar.dart';
import 'package:fleska_assignment/Screens/CustomWidgets/DissmissibleAppbar.dart';
import 'package:fleska_assignment/Screens/CustomWidgets/DownloadButton.dart';
import 'package:fleska_assignment/Screens/CustomWidgets/Header.dart';
import 'package:fleska_assignment/Screens/CustomWidgets/ImageCard.dart';
import 'package:fleska_assignment/Screens/CustomWidgets/InfoCard.dart';
import 'package:fleska_assignment/Screens/CustomWidgets/LocationCard.dart';
import 'package:fleska_assignment/Utils/Constants.dart';
import 'package:fleska_assignment/Utils/responsive_template.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, String> gridItems = {
    "Pasta": "images/foods/Pasta.jpeg",
    "Indian": "images/foods/Indian.jpeg",
    "Vegetarian": "images/foods/Vegetarian.jpeg",
    "Chicken": "images/foods/Chicken.jpeg",
    "Pizza": "images/foods/Pizza.jpeg",
    "Burger": "images/foods/Burger.jpeg",
    "Street": "images/foods/Street.jpeg",
    "Asian": "images/foods/Asian.jpeg",
  };
  Map<String, String> locations = {
    "Berlin": "images/locations/Berlin.jpeg",
    "Essen": "images/locations/Essen.jpeg",
    "Munchen": "images/locations/Munchen.jpeg",
    "Nurberg": "images/locations/Nurberg.jpeg",
  };
  late ScrollController _scrollController;
  bool showAppBar = false;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 700) {
        setState(() {
          showAppBar = true;
        });
      } else if (_scrollController.offset < 700) {
        setState(() {
          showAppBar = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AnimatedContainer(
          width: double.maxFinite,
          height: showAppBar ? 75 : 0,
          curve: Curves.linear,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                spreadRadius: 2,
                offset: Offset(0, 2),
                blurRadius: 10,
                color: Colors.black12,
              ),
            ],
          ),
          duration: Duration(
            milliseconds: 200,
          ),
          child: DismissibleAppBar(),
        ),
      ),
      body: ResponsiveTemplate(
        builder: (context, size) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: Header(),
                            ),
                            SizedBox(
                              height: size.height * 0.54,
                              width: size.width,
                              child: Image.asset(
                                "images/bg.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: size.height * 0.28,
                          left: size.width * 0.23,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "LOCAL RESTAURANTS.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.height * 0.09,
                                  wordSpacing: 0.8,
                                  letterSpacing: 0.4,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(2, 4),
                                      blurRadius: 4,
                                      color: Colors.black26,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Delivered Directly To You.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.height * 0.07,
                                  wordSpacing: 0.8,
                                  letterSpacing: 0.4,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(2, 4),
                                      blurRadius: 4,
                                      color: Colors.black26,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              CustomSearchBar(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "THE TASTE OF YOUR DESIRE",
                            style: subHeader,
                          ),
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                          Expanded(
                            child: GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 4,
                              children: gridItems.entries.map((item) {
                                return ImageCard(
                                  title: item.key,
                                  imgPath: item.value,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.06,
                    ),
                    child: Text(
                      "YOUR FAVOURITE RESTAURANT IN YOUR CITY",
                      style: subHeader,
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.85,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.17,
                        vertical: size.height * 0.04,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LocationCard(
                            imgPath: "images/locations/Franfurt.jpeg",
                            title: "Franfurt",
                            cardWidth: size.width * 0.28,
                            cardHeight: size.height * 0.762,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              physics: NeverScrollableScrollPhysics(),
                              children: locations.entries
                                  .map(
                                    (item) => LocationCard(
                                      imgPath: item.value,
                                      title: item.key,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: KyelloLite,
                    width: size.width,
                    height: size.height * 1.06,
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.08,
                      horizontal: size.width * 0.018,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "LOVE LOCAL",
                          style: subHeader,
                        ),
                        SizedBox(
                          height: size.height * 0.06,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.1,
                          ),
                          child: Text(
                            "Looking for a way to support your local restaurants? Then Eatarian is the right place for you! Our platform allows you to order directly from your favorite restaurant with very little or no commission on your food order. Plus, it's easy to find and explore nearby restaurants. So order with us today and help the restaurants near you!",
                            textAlign: TextAlign.center,
                            style: paragraph,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Flexible(
                                child: InfoCard(
                                  title: "ORDER",
                                  description:
                                      "Order food online from your home with the eatarian app or directly on the restaurant's own website or app.",
                                  iconPath: "images/icon/order-icon.webp",
                                ),
                              ),
                              VerticalDivider(
                                color: Colors.grey.shade400,
                              ),
                              Flexible(
                                child: InfoCard(
                                  title: "ENJOY",
                                  description:
                                      "Restaurant prepares and brings the food to your doorsteps and you enjoy the delicacy at your comfort.",
                                  iconPath: "images/icon/enjoy-icon.webp",
                                ),
                              ),
                              VerticalDivider(
                                color: Colors.grey.shade400,
                              ),
                              Flexible(
                                child: InfoCard(
                                  title: "SUPPORT",
                                  description:
                                      "Your direct order helps the restaurant to save hidden and high commissions from third parties and help your favorite restaurant to grow.",
                                  iconPath: "images/icon/service-icon.webp",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.9,
                    width: size.width,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: size.width * 0.3,
                              color: Colors.black,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Worry no more! You can get your own website and app with us, or simply list your restaurant on eatarian. Let your customers find and order with you without paying a hefty commission.",
                                      textAlign: TextAlign.center,
                                      style: paragraph.copyWith(
                                        color: Colors.white,
                                        fontSize: size.height * 0.025,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: size.height * 0.04,
                                        ),
                                        width: size.width * 0.22,
                                        height: size.height * 0.07,
                                        decoration: gradientButtonDecoration,
                                        child: Center(
                                          child: Text(
                                            "INQUIRE NOW",
                                            style: subHeader.copyWith(
                                              fontSize: size.height * 0.024,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.7,
                              height: size.height * 0.9,
                              child: Image.asset(
                                "images/misc/chef-bg.png",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          top: 20,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.04,
                              ),
                              width: size.width * 0.16,
                              height: size.height * 0.06,
                              decoration: gradientButtonDecoration.copyWith(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "BECOME A PARTNER",
                                  style: subHeader.copyWith(
                                    fontSize: size.height * 0.022,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: KyelloLite,
                    width: size.width,
                    height: size.height * 0.86,
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.08,
                      horizontal: size.width * 0.034,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            height: double.maxFinite,
                            child: Image.asset(
                              "images/misc/footer-bg.webp",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Download the eatarian app.",
                              style: paragraph.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 23,
                              ),
                            ),
                            Text(
                              "PICKUP DELIVERY or RESERVATION",
                              style: subHeader,
                            ),
                            Text(
                              "Directly from your favourite local restaurant.",
                              style: subHeader.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 26,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                DownloadButton(
                                  size: size,
                                  iconPath: "images/icon/google-play.png",
                                  title: "Get it on",
                                  content: "Google Play",
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                DownloadButton(
                                  size: size,
                                  iconPath: "images/icon/apple.png",
                                  title: "Available on",
                                  content: "App Store",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.074,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Copyright 2022 | FLEKSA",
                          ),
                          Spacer(),
                          Text(
                            "Restaurants   Terms   Privacy   Policy    Imprint",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
