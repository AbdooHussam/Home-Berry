import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_berry/Animation/FadeAnimation.dart';
import 'package:home_berry/network/api.dart';
import 'package:home_berry/screens/Home/nav_screen.dart';
import 'package:home_berry/screens/Register.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool securePass = true;
  String email = "";
  String pass = "";
  bool showSpinner = false;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<Api>(context);
    return SafeArea(
        child: Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Form(
                key: _key,
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.07,
                    ),
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.1,
                    ),
                    FadeAnimation(
                        1.3,
                        TextFormField(
                          onChanged: (val) {
                            email = val;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Feild is Required";
                            } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email)) {
                              return "Email not Valid";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              prefixIcon: const Icon(
                                Icons.email,
                                size: 30,
                              ),
                              labelText: "Email",
                              labelStyle: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              hintText: "*****@***.com",
                              hintStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              fillColor: Colors.white,
                              filled: true),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                        )),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.03,
                    ),
                    FadeAnimation(
                        2,
                        TextFormField(
                          onChanged: (val) {
                            pass = val;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Feild is Required";
                            } else if (value.length < 8) {
                              return "Password length at least 8";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              prefixIcon: const Icon(
                                Icons.lock,
                                size: 30,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    securePass = !securePass;
                                  });
                                },
                                icon: Icon(
                                  securePass ? Icons.remove_red_eye : Icons
                                      .security,
                                  size: 30,
                                ),
                              ),
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              hintText: "Enter your Password",
                              hintStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              fillColor: Colors.white,
                              filled: true),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: securePass,
                        )),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.09,
                    ),
                    FadeAnimation(
                        3,
                        ElevatedButton(
                          onPressed: () async {
                            if (_key.currentState.validate()) {
                              api.email = email;
                              api.pass = pass;
                              await api.login();

                              setState(() {
                                showSpinner = true;
                              });

                              Fluttertoast.showToast(
                                msg: api.message_login,
                                fontSize: 15,
                                toastLength: Toast.LENGTH_LONG,
                                timeInSecForIosWeb: 10,
                              );
                              showSpinner = false;

                              if (api.status_login == '1') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Nav_Home()));
                              }
                              showSpinner = false;
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 13),
                            child: Text(
                              "LOG IN",
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 15,
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11))),
                        )),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.03,
                    ),
                    FadeAnimation(3.5, ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          minimumSize: Size(double.infinity, 50), elevation: 15
                      ),
                      icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                      label: Text('Sign Up with Google', style: TextStyle(
                          fontSize: 19, fontWeight: FontWeight.bold),),
                      onPressed: () async {
                        await api.googleLogin();
                        try {
                          final user = FirebaseAuth.instance.currentUser;
                          user.email;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Nav_Home()));
                        } catch (e) {
                          print("Faild sign up");
                          print(e.toString());
                        }

                      },
                    )), // ElevatedButton.icon
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        FadeAnimation(
                            3,
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
