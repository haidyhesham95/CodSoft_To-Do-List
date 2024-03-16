import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/note_cubit.dart';
import '../widget/app_bar.dart';
import '../widget/button_widget.dart';
import '../widget/const_text_field.dart';

class EditTodo extends StatelessWidget {
  const EditTodo({super.key,required this.oldTitle,required this.oldSubTitle,required this.docId});

  final String oldTitle;
  final String oldSubTitle;
  final String docId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {},
      builder: (context, state) {
        NoteCubit cubit = NoteCubit.get(context);
        return Scaffold(
          appBar: noteAppBar(context, 'Edit To-Dos'),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  ConstTextField(
                      onChanged: cubit.onChangeTitle, hintText: oldTitle),
                  const SizedBox(height: 20),
                  ConstTextField(
                    onChanged: cubit.onChangeSubTitle,
                    hintText: oldSubTitle,
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  ButtonWidget(
                    hasElevation: true,
                    text: "EDIT",
                    onPressed: () {
                      cubit.editTodo(
                        noteId: docId,
                      );
                      Navigator.pop(context);
                    },
                    borderRadius: 10,
                    width: 150,
                    height: 42,
                    margin: const EdgeInsets.only(top: 20),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
