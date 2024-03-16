import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_dos/to_dos/widget/button_widget.dart';
import 'package:to_dos/to_dos/widget/const_text_field.dart';
import '../manager/note_cubit.dart';
import '../model/note_model.dart';
import '../widget/app_bar.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:noteAppBar(context, 'Add To-Dos'),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child:BlocConsumer<NoteCubit, NoteState>(
            listener: (context, state) {},
            builder: (context, state) {
              NoteCubit cubit = NoteCubit.get(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80,),
                  ConstTextField(
                      controller: cubit.titleController,
                      hintText:'Title'

                  ),
                  const SizedBox(height: 20),
                  ConstTextField(
                    controller: cubit.subTitleController,
                    hintText:'Description',
                    maxLines: 5,
                  ),

                  const SizedBox(height: 200,),
                  ButtonWidget(
                    hasElevation: true,
                    text: "ADD",
                    onPressed: () {
                      cubit.addTodo(noteModel: NoteModel(
                          title: cubit.titleController.text,
                          subTitle: cubit.subTitleController.text,
                        date: DateFormat("dd/MM-hh.mm").format(DateTime.now()),
                      ));
                      cubit.titleController.clear();
                      cubit.subTitleController.clear();
                      Navigator.of(context).pop();
                    },
                    width: 150,
                    height: 42,
                    margin: const EdgeInsets.only(top: 20),
                  ),
                ],
              );
            },
          ),
        ),
      ),


    );
  }
}
