import 'package:flutter/material.dart';
import 'package:home_berry/Animation/FadeAnimation.dart';
import 'package:home_berry/components/default_button.dart';
import 'package:home_berry/network/api.dart';
import 'package:home_berry/screens/Home/nav_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  final _key = GlobalKey<FormState>();
  bool spinner = false;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    var api2 = Provider.of<Api>(context);
    return ModalProgressHUD(
      inAsyncCall: spinner,
      child: Form(
        key: _key,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.09),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeAnimation(
                    1.2,
                    SizedBox(
                      width: getProportionateScreenWidth(60),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        // autofocus: true,
                        //obscureText: true,
                        style: TextStyle(fontSize: 24),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: otpInputDecoration,
                        onChanged: (value) {
                          nextField(value, pin2FocusNode);
                        },
                      ),
                    )),
                FadeAnimation(
                    2,
                    SizedBox(
                      width: getProportionateScreenWidth(60),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        focusNode: pin2FocusNode,
                        // obscureText: true,
                        style: TextStyle(fontSize: 24),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: otpInputDecoration,
                        onChanged: (value) => nextField(value, pin3FocusNode),
                      ),
                    )),
                FadeAnimation(
                    2.5,
                    SizedBox(
                      width: getProportionateScreenWidth(60),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        focusNode: pin3FocusNode,
                        // obscureText: true,
                        style: TextStyle(fontSize: 24),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: otpInputDecoration,
                        onChanged: (value) => nextField(value, pin4FocusNode),
                      ),
                    )),
                FadeAnimation(
                    3,
                    SizedBox(
                      width: getProportionateScreenWidth(60),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        focusNode: pin4FocusNode,
                        //  obscureText: true,
                        style: TextStyle(fontSize: 24),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: otpInputDecoration,
                        onChanged: (value) {
                          if (value.length == 1) {
                            pin4FocusNode.unfocus();
                            // Then you need to check is the code is correct or not
                          }
                        },
                      ),
                    )),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            FadeAnimation(
                4,
                DefaultButton(
                  text: "Submit",
                  press: () async {
                    spinner = true;
                    if (_key.currentState.validate()) {
                      await api2.verification();

                      if (api2.status_vrification == '1') {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Nav_Home()));
                      }
                      spinner = false;
                    }
                    spinner = false;
                  },
                ))
          ],
        ),
      ),
    );
  }
}
