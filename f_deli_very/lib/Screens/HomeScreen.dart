import 'package:f_deli_very/ApiIntegration/UserApiCall.dart';
import 'package:f_deli_very/ModelClass/UserDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/rendering.dart';
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

  List imageList = [
    "assets/delivery_logo.png",
    "assets/fast-food_logo.png",
    "assets/hotfood_logo.png"
  ];

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

  var constraints = Constraints;
  late ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
              ),
            ),
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
                        "B-14,Kumaran Colony Ammapalayam,tirupur",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.person_pin,
                      color: Colors.grey.shade500,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "B-14,Kumaran colony ammapalayam,tirupur",
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Card(
                      elevation: 0.5,
                      color: Colors.grey.shade200,
                      child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                width: 50,
                                height: 50,
                                image: AssetImage(
                                  imageList[index]
                                )),
                          )));
                }, childCount: 3),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 35,
                    childAspectRatio: 1.3)),
          ),
        ],
      )),
    );
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
