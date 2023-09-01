import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Controllar/Cubits/add_note_cubit.dart';
import 'package:notes_app/Controllar/States/add_notes_state.dart';
import '../Views/edit_note.dart';
import 'package:intl/intl.dart';

class CustomItemNote extends StatelessWidget {
  const CustomItemNote(
      {Key? key,
      required this.title,
      required this.content,
      required this.index,
      required this.iconOnPressed})
      : super(key: key);
  final String title;
  final String content;
  final int index;
  final void Function() iconOnPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            print('dssds');
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EditNoteView(
                title: NotesCubit.get(context).notesDate[index]['title'],
                noteKey: NotesCubit.get(context).notesDate[index]['key'],
                contant: NotesCubit.get(context).notesDate[index]['contant'],
              );
            }));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              color: const Color(0xffFFCC80),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    title,
                    style: TextStyle(fontSize: 26, color: Colors.black),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(content,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 18)),
                  ),
                  trailing: GestureDetector(
                    onTap: iconOnPressed,
                    child: Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                   DateFormat('yyyy-MM-dd ').format(DateTime.now()) ,
                    style:
                    TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5,right: 25.0),
                  child: Text(
                    DateFormat('KK:mm a').format(DateTime.now()) ,
                    style:
                    TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
