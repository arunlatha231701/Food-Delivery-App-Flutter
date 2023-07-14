import 'package:f_deli_very/CustomizedWidgets/CustomizedTextFormField.dart';
import 'package:f_deli_very/HomeLandingScreen.dart';
import 'package:f_deli_very/ModelClass/UserDetailsRealm.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:realm/realm.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({Key? key}) : super(key: key);

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String _email, _password;
  late final TextEditingController _emailTextEditingController =
      TextEditingController();
  late final TextEditingController _passwordTextEditingController =
      TextEditingController();
  late SharedPreferences prefs;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  void signIn(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailTextEditingController.text,
            password: _passwordTextEditingController.text)
        .catchError((onError) {
      return onError;
    }).then((authUser) async => {
              if (authUser.user != null)
                {
                  prefs = await SharedPreferences.getInstance(),
                  prefs.setString(
                      "userId", authUser.user!.uid.characters.first),
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (
                    BuildContext context,
                  ) {
                    return BottomNavigationPage();
                  }), (route) => false)
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_ios_sharp,
          color: Colors.black,
        ),
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 28, bottom: 40),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: CustomizedTextFormField(
                          controller: _emailTextEditingController,
                          focusNode: emailFocusNode,
                          hintText: "Enter email ",
                          textInputType: TextInputType.text,
                          prefixIcon: Icons.person_2_outlined,
                          focusNodeNext: passwordFocusNode,
                          obscureText: false,
                          onsaved: (value) {
                            _emailTextEditingController.text = value!;
                          },
                          validator: (email) {
                            if (email!.isEmpty) {
                              return "Please Enter Email id";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email)) {
                              return "Not a valid Email";
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          name: 'Username',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          bottom: 32,
                        ),
                        child:  CustomizedTextFormField(
                          focusNodeNext: null,
                          obscureText: true,
                          focusNode: passwordFocusNode,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          prefixIcon: Icons.lock_outline_rounded,
                          textInputType: TextInputType.visiblePassword,
                          hintText: 'Enter Password',
                          controller: _passwordTextEditingController,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return "Please Enter Password";
                            } else if (password.length < 8) {
                              return "Password length is low";
                            }
                            return null;
                          },
                          onsaved: (value){
                            _passwordTextEditingController.text = value!;
                          }, name: 'Password',
                        )

                        ,
                      ),
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 55,
                          margin: const EdgeInsets.only(
                            bottom: 20,
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
                          if (formKey.currentState!.validate()) {
                            /* if (_emailTextEditingController.text.isEmpty) {
                              "Please Enter Email id";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(_emailTextEditingController.text)) {
                              "Not a valid Email";
                            }*/

                            formKey.currentState!.save();
                            signIn(context);
                            print("valid");
                          }
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.only(right: 30, bottom: 70),
                        child: Text(
                          "Forget password ?",
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
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
                              width: MediaQuery.of(context).size.width * 0.37,
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
        ),
      ),
    );
  }
}
