import 'dart:async';

import 'package:f_deli_very/OnBoardingScreens/onBoardScreen.dart';
import 'package:f_deli_very/HomeLandingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'OnBoardingScreens/OnBoardingPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(color: Colors.white)),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final login_user = preferences.get("userId");
    if (login_user != null) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (context) => const BottomNavigationPage()));
    } else {
      await Future.delayed(const Duration(seconds: 3)).then((value) => {
            Navigator.of(context).pushReplacement(CupertinoPageRoute(
                builder: (context) => const OnBoardingScreens()))
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/food_delivery_logo.png")),
          ],
        ),
      ),
    );
  }
}
