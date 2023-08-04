import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_berry/network/api.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'nav_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showSpinner = false;

  String email, displayName, photoURL;
  Future _future;

  Future<void> prepareData() async {
    var access = Provider.of<Api>(context, listen: false);
    print(access.email);
    print(access.name);

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      photoURL = "https://researcher.almojam.org/api/assets/unknown.jpg";
      email = access.email;
      displayName = access.name;
    } else {
      photoURL = user.photoURL;
      email = user.email;
      displayName = user.displayName;
    }
    ;
  }

  @override
  void initState() {
    _future = prepareData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF9A537),
          centerTitle: true,
          title: const Text(
            "Profile Details",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Nav_Home()));
              }),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22),
                          topLeft: Radius.circular(22))),
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: (25 / 375.0) *
                                MediaQuery.of(context).size.width,
                          ),
                          CircleAvatar(
                            radius: 55,
                            child: ClipOval(
                              child: Image.network(
                                photoURL,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: (50 / 375.0) *
                                MediaQuery.of(context).size.width,
                          ),
                          Wrap(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "User Name: ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                "(${displayName})",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Email: ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                "(${email})",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
