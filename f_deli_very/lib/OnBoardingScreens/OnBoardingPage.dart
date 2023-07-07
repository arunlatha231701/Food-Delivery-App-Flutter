import 'package:f_deli_very/register.dart';
import 'package:flutter/material.dart';

import '../login.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.bottomLeft,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.43,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.06,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/landing_screen_logo_2.jpg",
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 55,
                      margin: const EdgeInsets.only(
                        top: 37,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreenPage()));
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 55,
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey.shade200,
                          borderRadius:
                          BorderRadius.circular(50)),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade100,
                            height: 25,
                            thickness: 2,
                            indent: 8,
                            endIndent: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            "Or connect with",
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Image.asset(
                            "assets/landing_food_logo.png",
                            width: MediaQuery.of(context).size.width * 0.45,
                            alignment: Alignment.bottomLeft,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/facebook.png",
                            width: 40,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/google-plus.png",
                            width: 40,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/twitter.png",
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
