import 'package:f_deli_very/ApiIntegration/UserApiCall.dart';
import 'package:f_deli_very/ModelClass/UserDetails.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_deli_very/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String UserName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _saveDataInSharedPreferences();
  }

  void _saveDataInSharedPreferences() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      UserName = (preferences.getString("userId") ?? null)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 100,
          title: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.my_location_outlined,
                    color: Colors.deepOrangeAccent,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Flexible(
                    child: Text(
                      "b-14,kumaran colony ammapalayam,tirupur",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey.shade200,
                  )
                ],
              ),
              Text(
                "b-14,kumaran colony ammapalayam,tirupur",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              )
            ],
          ),

          /*const Icon(
            Icons.my_location_outlined,
            color: Colors.deepOrangeAccent,
            size: 18,
          ),*/

          bottom: AppBar(
            backgroundColor: Colors.white,
            title: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          "Search  for dishes,restaurants",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search_outlined,
                      color: Colors.grey.shade400,
                      size: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: VerticalDivider(
                        color: Colors.grey.shade400,
                        thickness: 1,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.mic,
                        color: Colors.deepOrangeAccent,
                        size: 21,
                      ),
                    ),
                  ],
                )),
          ),
        ),
        /*SliverGrid(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text(
                  "Hello EveryOne",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1))*/
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            color: Colors.green,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            color: Colors.orange,
          ),
        ])),
      ],
    ));
  }
}
/*NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, scrolled) => [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  pinned: true,
                  floating: true,
                  snap: true,
                  leading: const Icon(
                    Icons.my_location,
                    color: Colors.deepOrangeAccent,
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(0.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 100,
                      color: Colors.grey,
                    ),
                  ),
                  */ /*actions: [
              IconButton(
                icon: Icon(Icons.comment),
                tooltip: 'Comment Icon',
                onPressed: () {},
              ),
            ],*/ /*
                  */ /*expandedHeight: MediaQuery.of(context).size.height * 0.1,
            flexibleSpace:  FlexibleSpaceBar(
              title: Text(
                '$UserName',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),*/ /*
                ),
              ],
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text(
                      "Hello EveryOne",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text(
                      "Hello EveryOne",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text(
                      "Hello EveryOne",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          )

          */ /*SliverList(
          delegate: SliverChildListDelegate([
            */ /* */ /*Container(
              height:MediaQuery.of(context).size.height * 2,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<List<UserDetails>>(
                future: UserApiCall().getdata(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final value = snapshot.data![index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(value.avatar),
                            ),
                            title: Text(value.firstName + value.lastName),
                            subtitle: Text(value.firstName),
                          );
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),*/ /* */ /*

          ])),*/ /*
          )*/
/*Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: InkWell(
          onTap: () async {
            await _auth.signOut();
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.clear();
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return LoginScreenPage();
            }), (route) => false);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(alignment: Alignment.center,
                color: Colors.orange
                , child: Text("log out")),
          ),
        ),
      )*/
