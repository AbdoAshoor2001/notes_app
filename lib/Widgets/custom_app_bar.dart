import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.icon,})
      : super(key: key);
  final String title;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Text(
          title ,
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        Spacer(),
        CustomSearchIcon(
          icon: icon,
        ),
      ],
    );
  }
}
