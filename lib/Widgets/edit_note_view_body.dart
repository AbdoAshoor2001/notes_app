import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';

import 'custom_text_filed.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
            ),
            SizedBox(height: 15,),
            CustomTextFiled(
              hintText: 'Title',
            ),
            CustomTextFiled(
              hintText: 'Content',
              maxLines: 7,
            )
          ],
        ),
      ),
    );
  }
}
