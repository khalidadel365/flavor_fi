import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, 
    this.hintText,
    this.onChange,
    this.onSubmit,
    this.inputType,
    this.obsecureText = false,
    this.prefix,
    this.sufix
  });
  String? hintText;
  bool obsecureText;
  Function(String)? onChange;
  Function(String)? onSubmit;
  TextInputType? inputType;
  Icon? prefix;
  IconButton? sufix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (date){
        if(date!.isEmpty){
          return 'field is required';
        }
        return null;
      },
      keyboardType: inputType,
      obscureText: obsecureText,
      onChanged: onChange,
      cursorColor: kPrimaryColor,
      style: TextStyle(
        color: Colors.black,
      ), //input style
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey
            ),
          borderRadius: BorderRadius.circular(22),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
                color: Colors.grey
            ),
          borderRadius: BorderRadius.circular(22),
        ),
        hintText: hintText,
        prefixIcon: prefix,
        suffixIcon: sufix,
      ),
    );
  }
}
