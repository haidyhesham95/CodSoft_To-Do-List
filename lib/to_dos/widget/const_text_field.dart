import 'package:flutter/material.dart';


class ConstTextField extends StatelessWidget {
  const ConstTextField({super.key, required this.hintText, this.maxLines=1, this.onSaved, this.onChanged,  this.controller,this.initialValue,});
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
 final void Function(String)? onChanged;
 final TextEditingController? controller;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: TextFormField(
        initialValue:initialValue ,
        controller: controller,
        onChanged:onChanged ,
        onSaved: onSaved,
        maxLines: maxLines,
        validator: (value){
          if (value?.isEmpty ?? true){
            return 'Field is required';
          }else{
            return null;
          }
        },
        cursorColor: Colors.purple.shade300,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:TextStyle(
              color: Colors.black12
          ),
         // fillColor: Colors.white,

          focusedBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(20),
            borderSide:  BorderSide(
              color: Colors.purple.shade200  ,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:  BorderSide(
                color: Colors.purple.shade200,
                width:1.5,
              )
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(20),
        ),

      ),
    );
  }
}
