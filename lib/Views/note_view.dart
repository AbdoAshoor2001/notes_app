import 'package:flutter/material.dart';
import 'package:notes_app/Controllar/Cubits/add_note_cubit.dart';
import '../Constants.dart';
import '../Widgets/add_note_bottom_sheet.dart';
import '../Widgets/custom_items_note.dart';

class NoteView extends StatelessWidget {
  const NoteView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          title: NotesCubit.get(context).searchOpen
              ? TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search.....',
                    hintStyle: TextStyle(color: kPrimaryColor, fontSize: 20),
                    border: InputBorder.none,
                  ),
                  onChanged: (input) {
                    NotesCubit.get(context).searchAboutNotes(input: input);
                  },
                )
              : const Text(
                  'Notes',
                  style: TextStyle(fontSize: 23),
                ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                  onTap: () {
                    NotesCubit.get(context).changeSearch();
                  },
                  child: NotesCubit.get(context).searchOpen
                      ? const Icon(
                          Icons.clear,
                          color: kPrimaryColor,
                        )
                      : const Icon(Icons.search, size: 30)),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: NotesCubit.get(context).notesSearch.isEmpty
                      ? NotesCubit.get(context).notesDate.length
                      : NotesCubit.get(context).notesSearch.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomItemNote(
                        index: index,
                        iconOnPressed: () {
                          NotesCubit.get(context).deleteNote(
                              noteKey: NotesCubit.get(context).notesDate[index]
                                  ['key']);
                        },
                        title: NotesCubit.get(context).notesSearch.isEmpty
                            ? NotesCubit.get(context).notesDate[index]['title']
                            : NotesCubit.get(context).notesSearch[index]['title'],
                        content: NotesCubit.get(context).notesSearch.isEmpty
                            ? NotesCubit.get(context).notesDate[index]['contant']
                            : NotesCubit.get(context).notesSearch[index]['contant'],
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
