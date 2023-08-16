import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_filed.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            CustomTextFiled(
              hintText: 'Title',
            ),
            CustomTextFiled(
              maxLines: 5,
              hintText: 'Content',
            ),
            CustomButton(),
            SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}

