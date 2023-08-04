import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_berry/Animation/FadeAnimation.dart';
import 'package:home_berry/network/api.dart';
import 'package:home_berry/screens/Login.dart';
import 'package:home_berry/screens/search/search_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showSpinner = false;

  Future _future;

  Future<void> prepareData() async {
    var mvcProvider = Provider.of<Api>(context, listen: false);
    (mvcProvider.myListCard1.isEmpty) ? await mvcProvider.getHome1() : null;
    (mvcProvider.myListCard2.isEmpty) ? await mvcProvider.getHome2() : null;
    (mvcProvider.myListCard3.isEmpty) ? await mvcProvider.getHome3() : null;
  }

  @override
  void initState() {
    _future = prepareData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var get = Provider.of<Api>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/home2.png",
                    height: 45,
                    width: 55,
                  ),
                  Text(
                    " HomeBerry".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.brown,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  Spacer(),
                  Text(
                    " Logout".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  IconButton(
                      onPressed: () async {
                        try {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove("access_token");
                          FirebaseAuth.instance.signOut();
                          await get.logeut();
                        } catch (e) {
                          print(e.toString());
                        }
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      icon: Icon(
                        Icons.logout_rounded,
                        color: Colors.orange,
                        size: 30,
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      get.type = "buy";
                      await get.myListSearchCard.clear();
                      setState(() {
                        showSpinner = true;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Search_Screen()));
                      setState(() {
                        showSpinner = false;
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "images/buy.png",
                              height: 55,
                              width: 70,
                              color: Colors.grey,
                            ),
                            const Text(
                              "Buy",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      get.type = "rent";
                      await get.myListSearchCard.clear();
                      setState(() {
                        showSpinner = true;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Search_Screen()));
                      setState(() {
                        showSpinner = false;
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "images/rent.jpeg",
                              height: 55,
                              width: 70,
                            ),
                            const Text(
                              "Rent",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/new.jpeg",
                            height: 55,
                            width: 80,
                          ),
                          const Text(
                            "New Project",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Projects",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.brown),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Show All",
                        style: TextStyle(color: Colors.amber, fontSize: 17),
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              (get.myListCard1.isEmpty)
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: get.myListCard1,
                      )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Cities",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.brown),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Show All",
                        style: TextStyle(color: Colors.amber, fontSize: 17),
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              (get.myListCard2.isEmpty)
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: get.myListCard2,
                      ),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Appartment",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.brown),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Show All",
                        style: TextStyle(color: Colors.amber, fontSize: 17),
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              (get.myListCard3.isEmpty)
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: get.myListCard3,
                      )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
