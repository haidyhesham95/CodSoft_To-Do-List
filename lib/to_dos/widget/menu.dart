import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, required this.onTapDelete,required this.onTapEdit});
final void Function()? onTapDelete;
  final void Function()? onTapEdit;
  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton(
      offset: const Offset(0, 15),
      color: Colors.white,
      elevation: 2,
      padding: EdgeInsets.zero,

      child: const Icon(Icons.more_vert,color: Colors.black38),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          onTap: onTapEdit,
          child:  Text("Edit",style: TextStyle(color: Colors.purple.shade200)),
        ),
        PopupMenuItem(
          value: 2,
          onTap: onTapDelete,
          child:  Text("Delete",style: TextStyle(color: Colors.purple.shade200),),
        ),
      ],
    );
  }
}
