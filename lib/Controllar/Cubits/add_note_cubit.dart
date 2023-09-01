import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Constants.dart';
import '../States/add_notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(AddNotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);
  List<Map<String, dynamic>> notesDate = [];

  addNote({required String title, required String contant}) async {
    await noteRef.add({
      'title': title,
      'contant': contant,
    }).then((value) {
      emit(AddNotesSuccess());
      getNotes();
    });
  }

  getNotes() {
    notesDate = noteRef.keys.map((e) {
      final currentNote = noteRef.get(e);
      return {
        'key': e,
        'title': currentNote['title'],
        'contant': currentNote['contant'],
      };
    }).toList();
    emit(GetNoteSuccess());
    debugPrint('Notes length is ${notesDate.length}');
  }

  void deleteNote({required int noteKey}) {
    noteRef.delete(noteKey);
    getNotes();
  }

  void updateNotes({required int noteKey}) {
    noteRef.put(noteKey,
        {'title': titleControllar.text, 'contant': contantControllar.text});
    getNotes();
    emit(NoteUpdatedSuccess());
  }

  List<Map<String, dynamic>> notesSearch = [];

  void searchAboutNotes({required String input}) {
    notesSearch = notesDate
        .where((element) => element['title']
            .toString()
            .toLowerCase()
            .startsWith(input.toLowerCase()))
        .toList();
    emit(FilterNotesSuccess());
  }
  bool searchOpen =false;
  void changeSearch (){
    searchOpen = ! searchOpen;
    if( searchOpen == false ) notesSearch.clear();
    emit(ChangeSearchSuccess());
  }
}
