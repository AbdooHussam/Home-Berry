import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    this.text,
    this.press,
  }) ;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          elevation: 15,
          primary: Colors.white,
          backgroundColor: Color(0xFFF9A537),
        ),
        onPressed: press as void Function(),
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(22), fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
