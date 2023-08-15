import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class NoteBodyView extends StatelessWidget {
  const NoteBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
      child: Column(
        children: const [
          CustomAppBar(),
        ],
      ),
    );
  }
}
