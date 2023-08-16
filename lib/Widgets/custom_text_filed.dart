import 'package:flutter/material.dart';

import '../Constants.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {Key? key, required this.hintText, this.maxLines = 1, this.onSaved})
      : super(key: key);
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, top: 10),
      child: TextFormField(
        onSaved: onSaved,
        validator: (value) {
          // علامه الاستفاهم هنا معناها بقوله لو هي مش ب null شوفها هي Empty ولا لا
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          }else{
            return null;
          }
        },
        maxLines: maxLines,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kPrimaryColor),
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
