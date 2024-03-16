part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}
class AddNoteLoading extends NoteState {}
class AddNoteSuccess extends NoteState {}
class AddNoteFail extends NoteState {}
class GetNote extends NoteState {}
class GetNoteError extends NoteState {}

class LoadingNote extends NoteState {}
class DeleteNote extends NoteState {}
class EditNote extends NoteState {}
class EditNoteError extends NoteState {}
class EditNoteLoading extends NoteState {}
class EditNoteSuccess extends NoteState {}



