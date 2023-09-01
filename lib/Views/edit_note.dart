import 'package:flutter/material.dart';
import 'package:notes_app/Constants.dart';
import 'package:notes_app/Controllar/Cubits/add_note_cubit.dart';
import 'package:notes_app/Widgets/custom_app_bar.dart';
import 'package:notes_app/Widgets/custom_text_filed.dart';

import 'note_view.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key, required this.title, required this.contant, required this.noteKey})
      : super(key: key);
  final String title;
  final String contant;
  final int noteKey;

  @override
  Widget build(BuildContext context) {
    contantControllar.text = contant;
    titleControllar.text = title;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onTapSearchIcon: () {
              if (titleControllar.value.text != title ||
                  contantControllar.value.text != contant) {
                NotesCubit.get(context).updateNotes(
                  noteKey: noteKey
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NoteView()
                    ));
              };
            }),
          CustomTextFiled(
            controller: titleControllar,

          ),
          CustomTextFiled(
            controller: contantControllar,
            maxLines: 8,
          ),
        ],
      ),
    ));
  }
}
