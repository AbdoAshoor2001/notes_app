import 'package:flutter/material.dart';

import '../Constants.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({Key? key, required this.hintText,  this.maxLines =1 }) : super(key: key);
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0,top: 10),
      child: TextField(
        maxLines: maxLines,
        cursorColor: KPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(KPrimaryColor),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
