abstract class NotesState {}

class AddNotesInitial extends NotesState {}

class AddNotesLoading extends NotesState {}

class AddNotesSuccess extends NotesState {}

class AddNotesFailure extends NotesState {
  final String errMessage;

  AddNotesFailure(this.errMessage);
}

class GetNoteSuccess extends NotesState {}

class NoteUpdatedSuccess extends NotesState {}

class FilterNotesSuccess extends NotesState {}

class ChangeSearchSuccess extends NotesState {}
