import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle HeadLineTextFieldStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle LightTextFieldStyle() {
    return TextStyle(
      color: Colors.black38,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle semiBoldTextFieldStyle() {
    return TextStyle(
      color: Colors.black38,
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }
}
