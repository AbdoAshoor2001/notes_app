import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Controllar/Cubits/add_note_cubit.dart';
import '../Constants.dart';
import '../Widgets/add_note_bottom_sheet.dart';
import '../Widgets/custom_items_note.dart';

class NoteView extends StatelessWidget {
  const NoteView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final notesCubit =BlocProvider.of<NotesCubit>(context)..notesDate..notesFliter..searchOpen;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                });
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appBarBackgroundColor,
          elevation: 0.0,
          title: notesCubit.searchOpen
              ? TextField(
            onChanged: (input) {
              notesCubit.filterNotes(input: input);
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle:
                TextStyle(color: Colors.white, fontSize: 20)),
          )
              : Text(
            'Notes',
            style: TextStyle(fontSize: 23),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: GestureDetector(
                  onTap: () {
                    notesCubit.changeSearch;
                  },
                  child: Icon(
                      notesCubit.searchOpen
                          ? Icons.clear
                          : Icons.search,
                      size: 30)),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: NotesCubit.get(context).notesFliter.isEmpty
                      ? NotesCubit.get(context).notesDate.length
                      : NotesCubit.get(context).notesFliter.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomItemNote(
                        index: index,
                        iconOnPressed: () {
                          NotesCubit.get(context).deleteNote(
                              noteKey: NotesCubit.get(context)
                                  .notesDate[index]['key']);
                        },
                        title: NotesCubit.get(context).notesFliter.isEmpty
                            ? NotesCubit.get(context).notesDate[index]
                        ['title']
                            : NotesCubit.get(context).notesFliter[index]
                        ['title'],
                        content: NotesCubit.get(context).notesFliter.isEmpty
                            ? NotesCubit.get(context).notesDate[index]
                        ['contant']
                            : NotesCubit.get(context).notesFliter[index]
                        ['contant'],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));


  }
}
