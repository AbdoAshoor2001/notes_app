abstract class NotesState {}

class AddNotesInitial extends NotesState {}

class AddNotesLoading extends NotesState {}

class AddNotesSuccess extends NotesState {}

class AddNotesFailure extends NotesState {
  final String errMessage;

  AddNotesFailure(this.errMessage);
}

class GetNoteSuccess extends NotesState {}

class GetNoteFailure extends NotesState {
  final String errorMessage;

  GetNoteFailure(this.errorMessage);
}

class NoteUpdatedSuccess extends NotesState {}

class FilterNotesSuccess extends NotesState {}
class ChangeSearchSuccess extends NotesState {}

class FilterNotesFailure extends NotesState {
  final String eMessage;

  FilterNotesFailure(this.eMessage);
}
