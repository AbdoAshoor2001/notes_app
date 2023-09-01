import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Constants.dart';
import '../Controllar/Cubits/add_note_cubit.dart';
import '../Controllar/States/add_notes_state.dart';
import 'custom_button.dart';
import 'custom_text_filed.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is AddNotesFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextFiled(
                    controller: titleControllar,
                    onSaved: (value) {
                      title = value;
                    },
                    hintText: 'Title',
                  ),
                  CustomTextFiled(
                    controller: contantControllar,
                    onSaved: (value) {
                      subTitle = value;
                    },
                    maxLines: 5,
                    hintText: 'Content',
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (titleControllar.value.text.isNotEmpty &&
                            contantControllar.value.text.isNotEmpty) {
                          await NotesCubit.get(context).addNote(
                            contant: contantControllar.value.text,
                            title: titleControllar.value.text,
                          );
                          titleControllar.clear();
                          contantControllar.clear();
                          await NotesCubit.get(context).getNotes();
                        }
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                      }
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
