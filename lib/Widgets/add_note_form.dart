import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Controllar/Cubits/add_note_cubit.dart';
import 'custom_button.dart';
import 'custom_text_filed.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            CustomTextFiled(
              onSaved: (value) {
                title = value;
              },
              hintText: 'Title',
            ),
            CustomTextFiled(
              onSaved: (value) {
                subTitle = value;
              },
              maxLines: 5,
              hintText: 'Content',
            ),
            CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<NotesCubit>(context).addNote;
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
