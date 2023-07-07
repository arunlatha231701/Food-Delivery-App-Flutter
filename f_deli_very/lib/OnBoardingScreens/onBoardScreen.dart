import 'dart:developer';

import 'package:f_deli_very/OnBoardingScreens/OnBoardingPage.dart';
import 'package:f_deli_very/login.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  List<ContentConfig> listContentConfig = [];
  Color activeColor = const Color(0xffff4500);
  Color inactiveColor = const Color(0xffff8c00);
  double sizeIndicator = 10;

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        title: "Hygiene Food",
        description: "“What you eat literally becomes you. ...",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic),
        styleTitle: TextStyle(
            color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        pathImage: "assets/onboarding_logo_1.png",
        backgroundColor: Color(0xffffffff),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Spicy Food",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic),
        styleTitle: TextStyle(
            color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        description: "Spice a dish with love and it pleases every palate.",
        pathImage: "assets/taste_spicy.png",
        backgroundColor: Color(0xffffffff),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Get's Started",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic),
        styleTitle: TextStyle(
            color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        description: "There is no love sincerer than the love of food.",
        pathImage: "assets/get_started_logo.png",
        backgroundColor: Color(0xffffffff),
      ),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      foregroundColor: MaterialStateProperty.all<Color>(activeColor),
      backgroundColor: MaterialStateProperty.all<Color>(inactiveColor),
    );
  }

  Widget renderNextButton() {
    return const  Text("Next",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400));

  }
  Widget renderDoneButton() {
    return const   Text("Done",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400));

  }
  Widget renderSkipButton() {
    return const   Text("Skip",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400,));
  }

  void onDonePress() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OnBoardingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      backgroundColorAllTabs: Colors.white,
      renderSkipBtn: renderSkipButton(),
      skipButtonStyle:myButtonStyle() ,
      renderNextBtn: renderNextButton(),
      nextButtonStyle: myButtonStyle(),
      renderDoneBtn: renderDoneButton(),
      doneButtonStyle: myButtonStyle(),
      onDonePress: onDonePress,
      indicatorConfig: IndicatorConfig(
          sizeIndicator: sizeIndicator,
           indicatorWidget: Container(
            width: sizeIndicator,
            height: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: inactiveColor),
          ),
      activeIndicatorWidget:Container(
        width: sizeIndicator,
        height: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: activeColor),
      ),
        spaceBetweenIndicator: 5,
      ),
      isAutoScroll: true,
      curveScroll: Curves.bounceIn,
    );
  }
}
