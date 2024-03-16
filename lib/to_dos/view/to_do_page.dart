import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dos/to_dos/view/edit_to_do.dart';
import 'package:to_dos/to_dos/widget/app_bar.dart';
import 'package:to_dos/to_dos/widget/menu.dart';
import '../manager/note_cubit.dart';
import '../widget/floating_button.dart';
import '../widget/shadow_container.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({ super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {},
      builder: (context, state) {
        NoteCubit cubit = NoteCubit.get(context);
        return Scaffold(
          appBar: noteAppBar(context, 'To-Dos'),
          floatingActionButton: addFloatingButton(context),
          body:state is LoadingNote
              ?  Center(child: CircularProgressIndicator(color: Colors.purple.shade300,))
              : GridView.builder(
            padding:const EdgeInsets.only(top: 18) ,
              itemCount: cubit.notes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                mainAxisExtent: 150,
              ),
              itemBuilder: (context, index) {
                return ShadowContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7,top: 15),
                            child: Text(
                              "${cubit.notes[index].title}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 5),
                            child: Text(
                              cubit.notes[index].subTitle.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                cubit.notes[index].date.toString(),
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.black38),
                              )),
                          Menu(
                             onTapEdit: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditTodo(
                                    docId: cubit.notes[index].id.toString(),
                                    oldSubTitle: cubit.notes[index].subTitle.toString(),
                                    oldTitle: cubit.notes[index].title.toString(),
                                  ),
                                ),
                              );
                            },
                            onTapDelete: () async {
                              cubit.deleteTodo(
                                noteId: cubit.notes[index].id.toString(),
                              );
                            },

                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
