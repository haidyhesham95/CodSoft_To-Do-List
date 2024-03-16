import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../model/note_model.dart';


part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context) => BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  List<NoteModel> notes = [];
  List<String> noteId = [];

  String? title;
  String? subTitle;
  String? date;

  void onChangeTitle(String? value) {
    title = value;
  }

  void onChangeSubTitle(String? value) {
    subTitle = value;
  }



 Future<void> addTodo({
    required NoteModel noteModel,
      String? id,
  }) async {
    emit(AddNoteLoading());
    DocumentReference docRef = FirebaseFirestore.instance
        .collection("notes").doc(id);

    await docRef.set(noteModel.toMap(id: docRef.id));
     getTodo();

    emit(AddNoteSuccess());
    print('Note added successfully!');
  }






  void getTodo() async {
    emit(LoadingNote());
    final snapshot = await FirebaseFirestore.instance.collection('notes').get();
    notes.clear();
    for (var element in snapshot.docs) {
      final noteData = await element.reference.get();
      notes.add(NoteModel.fromJson(noteData.data()));

    }

    emit(GetNote());
    print(notes);
  }






  void deleteTodo({
    required String noteId,
  }) async {
    try {
      await FirebaseFirestore.instance

          .collection("notes")
          .doc(noteId)
          .delete()
          .then((value) {
        getTodo();
      });

      emit(DeleteNote());

      print('Note deleted successfully!');
    } catch (e) {
      print('Error deleting note: $e');
    }
  }



 void editTodo(
  {
     String? noteId,
  }
      )
 async {
    await FirebaseFirestore.instance.collection('notes')
            .doc(noteId).update({
        'title': title ,
        'subTitle': subTitle ,
      'date': DateFormat("dd/MM-hh.mm").format(DateTime.now()),

      }) .then((value) {
        getTodo();
    } );
   emit(EditNote());
   }




}
