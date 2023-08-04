import 'package:flutter/material.dart';
import 'package:home_berry/Animation/FadeAnimation.dart';
import 'package:home_berry/network/api.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/otp_form.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({this.phone});

  // static String routeName = "/otp";

  String phone = "0";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFF9A537),
        title: Text(
          "Verify Phone Number",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            FadeAnimation(
                1,
                Text(
                  "OTP Verification",
                  style: headingStyle,
                )),
            FadeAnimation(
                1.5,
                Text(
                  "We sent your code to ( $phone )",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                )),
            buildTimer(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(22),
                        topLeft: Radius.circular(22))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        OtpForm(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        FadeAnimation(
                            4.5,
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Resend OTP Code",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTimer() {
    return FadeAnimation(
        1.8,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This code will expired in ",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            TweenAnimationBuilder(
              tween: Tween(begin: 30.0, end: 0.0),
              duration: Duration(seconds: 30),
              builder: (_, dynamic value, child) => Text(
                "00:${value.toInt()}",
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ],
        ));
  }
}
