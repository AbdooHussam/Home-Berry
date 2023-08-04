import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_berry/Animation/FadeAnimation.dart';
import 'package:home_berry/network/api.dart';
import 'package:home_berry/screens/otp/otp_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'Login.dart';
import 'vrification_email.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool securePass = true;
  String name = "";
  String last_name = "";
  String email = "";
  String pass = "";
  String phone = "";
  bool showSpinner = false;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<Api>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF9A537),
          centerTitle: true,
          title: const Text(
            "Register",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Form(
            key: _key,
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
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: (val) {
                                    name = val;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Feild is Required";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        size: 30,
                                      ),
                                      labelText: "Name",
                                      labelStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      hintText: "Enter your Name",
                                      hintStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      fillColor: Colors.white,
                                      filled: true),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  onChanged: (val) {
                                    last_name = val;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Feild is Required";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        size: 30,
                                      ),
                                      labelText: "Last Name",
                                      labelStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      hintText: "Enter your Last Name",
                                      hintStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      fillColor: Colors.white,
                                      filled: true),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          FadeAnimation(
                              2,
                              TextFormField(
                                onChanged: (val) {
                                  phone = val;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Feild is Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      size: 30,
                                    ),
                                    labelText: "Phone number",
                                    labelStyle: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    hintText: "Enter your Phone",
                                    hintStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    fillColor: Colors.white,
                                    filled: true),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.phone,
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          FadeAnimation(
                              2.3,
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    fillColor: Colors.white,
                                    filled: true),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.emailAddress,
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          FadeAnimation(
                              2.5,
                              TextFormField(
                                onChanged: (val) {
                                  pass = val;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Feild is Required";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                                        securePass
                                            ? Icons.remove_red_eye
                                            : Icons.security,
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    fillColor: Colors.white,
                                    filled: true),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: securePass,
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          FadeAnimation(
                              3,
                              ElevatedButton(
                                onPressed: () async {
                                  if (_key.currentState.validate()) {
                                    api.email = email;
                                    api.name = name;
                                    api.last_name = last_name;
                                    api.pass = pass;
                                    api.phone = phone;
                                    await api.register();

                                    setState(() {
                                      showSpinner = true;
                                    });

                                    Fluttertoast.showToast(
                                      msg: api.message_reg,
                                      fontSize: 15,
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIosWeb: 10,
                                    );
                                    showSpinner = false;

                                    if (api.status_reg == '1') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OtpScreen(
                                                    phone: api.phone,
                                                  )));
                                    }
                                    showSpinner = false;
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 13),
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                      fontSize: 26,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 15,
                                    primary: Color(0xFFF9A537),
                                    // onPrimary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(11))),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          FadeAnimation(
                              3,
                              ElevatedButton(
                                onPressed: () async {
                                  if (_key.currentState.validate()) {
                                    api.email = email;
                                    api.name = name;
                                    api.last_name = last_name;
                                    api.pass = pass;
                                    api.phone = phone;
                                    await api.signUpEmailVerification();

                                    setState(() {
                                      showSpinner = true;
                                    });

                                    showSpinner = false;

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VerifyEmail()));

                                    showSpinner = false;
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 13),
                                  child: Text(
                                    "SIGN UP (Verification Email)",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 15,
                                    primary: Colors.red,
                                    // onPrimary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(11))),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(fontSize: 20),
                              ),
                              FadeAnimation(
                                  3.5,
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      },
                                      child: const Text(
                                        "Log in",
                                        style: TextStyle(
                                            fontSize: 21,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900),
                                      )))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
