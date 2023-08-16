import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/Constants.dart';
import 'package:notes_app/Models/note_model.dart';

import '../States/add_notes_state.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit(): super(NotesInitial());


  addNote(NoteModel note)async {
    emit(NotesLoading());
    try{
      var noteBox =  Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(NotesSuccess());
    } catch(e){
      NotesFailure(e.toString());

      }
    }

  }
