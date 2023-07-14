import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_deli_very/ModelClass/UserDetailsRealm.dart';
import 'package:f_deli_very/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:realm/realm.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController _nameTextEditingController =
      TextEditingController();
  late final TextEditingController _emailTextEditingController =
      TextEditingController();
  late final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  FocusNode userNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final config = Configuration.local([ModelUserDetailsRealm.schema]);
  late final realm = Realm(config);

  void _saveDataInFireStoreCloud() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("user").doc(firebaseUser?.uid).set({
      "name": _nameTextEditingController.text,
      "email": _emailTextEditingController.text,
      "password": _passwordTextEditingController.text
    }).then((value) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const LoginScreenPage()));
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
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(left: 28, bottom: 40),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: TextFormField(
                          controller: _nameTextEditingController,
                          focusNode: userNameFocusNode,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(emailFocusNode);
                          },
                          onSaved: (value) {
                            _nameTextEditingController.text = value!;
                          },
                          validator: (userNameValue) {
                            if (userNameValue!.isEmpty) {
                              return "Please Enter Username";
                            }
                            return null;
                          },
                          autofocus: true,
                          style: TextStyle(color: Colors.grey.shade400),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_2_outlined,
                              color: Colors.grey.shade400,
                            ),
                            hintText: "Username",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Colors.grey.shade200,
                                    width: 1.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Colors.grey.shade200,
                                  width: 1.0,
                                )),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: TextFormField(
                          focusNode: emailFocusNode,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(passwordFocusNode);
                          },
                          onSaved: (value) {
                            _emailTextEditingController.text = value!;
                          },
                          validator: (email) {
                            if (email!.isEmpty) {
                              return "Please Enter Email";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email)) {
                              return "Not a valid Email";
                            }
                            return null;
                          },
                          autofocus: true,
                          controller: _emailTextEditingController,
                          style: TextStyle(color: Colors.grey.shade400),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_2_outlined,
                              color: Colors.grey.shade400,
                            ),
                            hintText: "email",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Colors.grey.shade200,
                                    width: 1.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Colors.grey.shade200,
                                  width: 1.0,
                                )),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          bottom: 25,
                        ),
                        child: TextFormField(
                          focusNode: passwordFocusNode,
                          autofocus: true,
                          controller: _passwordTextEditingController,
                          onSaved: (value) {
                            _passwordTextEditingController.text = value!;
                          },
                          validator: (password) {
                            if (password!.isEmpty) {
                              return "Please Enter Password";
                            } else if (password.length < 8) {
                              return "Password length is low";
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.grey.shade400),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.grey.shade400,
                            ),
                            hintText: "password",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade200,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignCenter)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Colors.grey.shade200,
                                    width: 1.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade200,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  width: 1.0,
                                )),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 55,
                          margin: const EdgeInsets.only(
                            bottom: 15,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            var userDetails = ModelUserDetailsRealm(
                                _nameTextEditingController.text,
                                _emailTextEditingController.text,
                                _passwordTextEditingController.text);
                            realm.write(() {
                              realm.add(userDetails);
                            });

                            formKey.currentState!.save();
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailTextEditingController.text,
                                    password:
                                        _passwordTextEditingController.text)
                                .then((value) {
                              _saveDataInFireStoreCloud();
                            }).onError((error, stackTrace) {

                            });
                          }
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.only(right: 30, bottom: 40),
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
                        margin: const EdgeInsets.only(top: 25),
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
