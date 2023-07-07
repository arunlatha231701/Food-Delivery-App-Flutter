import 'package:f_deli_very/Screens/HomeScreen.dart';
import 'package:f_deli_very/Screens/MyListScreen.dart';
import 'package:f_deli_very/Screens/MyProfileScreen.dart';
import 'package:f_deli_very/Screens/OrdersScreen.dart';
import 'package:f_deli_very/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int pageIndex = 0;


  final pages = [
    const HomePage(),
    const OrderPage(),
    const MyListPage(),
    const MyProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
          selectedItemColor: Colors.orange,
          unselectedLabelStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400),
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIndex,
          items: [
             BottomNavigationBarItem(

                icon: pageIndex == 0
                    ? const Icon(
                        Icons.home_filled,
                        color: Colors.orange,
                        size: 26,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.grey,
                        size: 23,
                      ),
                   label:  'Home'
             ),
             BottomNavigationBarItem(
                icon: pageIndex == 1
                    ? const Icon(
                        Icons.list_rounded,
                        color: Colors.orange,
                        size: 26,
                      )
                    : const Icon(
                        Icons.list_alt_sharp,
                        color: Colors.grey,
                        size: 23,
                      ),label: 'Orders'),
            BottomNavigationBarItem(
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.shopping_bag_rounded,
                        color: Colors.orange,
                        size: 26,
                      )
                    : const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.grey,
                        size: 23,
                      ),label: 'My list'),
            BottomNavigationBarItem(
                icon: pageIndex == 3
                    ? const Icon(
                        Icons.person_2_rounded,
                        color: Colors.orange,
                        size: 26,
                      )
                    : const Icon(
                        Icons.person_2_outlined,
                        color: Colors.grey,
                        size: 23,
                      ),label: 'Profile')
          ],
          onTap: (int i) {
            setState(() {
              pageIndex = i;
            });
          },
        )
        /*Container(
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            IconButton(
                enableFeedback: true,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                        Icons.home_filled,
                        color: Colors.orange,
                        size: 28,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.grey,
                        size: 26,
                      )),
            IconButton(
                enableFeedback: true,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                        Icons. list_rounded,
                        color: Colors.orange,
                        size: 28,
                      )
                    : const Icon(
                        Icons.list_alt_sharp,
                        color: Colors.grey,
                        size: 26,
                      )),
            IconButton(
                enableFeedback: true,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.shopping_bag_rounded,
                        color: Colors.orange,
                        size: 28,
                      )
                    : const Icon(
                        Icons. shopping_bag_outlined,
                        color: Colors.grey,
                        size: 26,
                      )),
            IconButton(
                enableFeedback: true,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const Icon(
                        Icons.person_2_rounded,
                        color: Colors.orange,
                        size: 28,
                      )
                    : const Icon(
                        Icons. person_2_outlined,
                        color: Colors.grey,
                        size: 26,
                      )),

          ],
        ),
      ),*/
        );
  }
}
