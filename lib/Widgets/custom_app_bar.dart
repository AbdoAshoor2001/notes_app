import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTapSearchIcon,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final  Function()? onTapSearchIcon;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style:  TextStyle(fontSize: 23, color: Colors.white),
        ),
         Spacer(),
        Center(
          child: GestureDetector(
            onTap: widget.onTapSearchIcon,
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                widget.icon,
                size: 27,
              ),
            ),
          ),
        )
      ],
    );
  }
}
