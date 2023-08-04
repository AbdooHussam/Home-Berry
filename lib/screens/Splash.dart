import 'package:flutter/material.dart';
import 'package:home_berry/Animation/FadeAnimation.dart';
import 'package:home_berry/screens/Home/nav_screen.dart';
import 'package:home_berry/screens/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  String access;

  delay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    access = prefs.getString("access_token");
    Future.delayed(Duration(seconds: (access == null) ? 1 : 1), () {
      (access == null)
          ? Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()))
          : Navigator.push(
              context, MaterialPageRoute(builder: (context) => Nav_Home()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delay();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FadeAnimation(
                  1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/home2.png",
                        height: 70,
                        width: 70,
                      ),
                      Text(
                        " HomeBerry".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
