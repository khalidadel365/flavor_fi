import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text,required this.onPressed});
  String text;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(22)
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            text,style: TextStyle(
            fontSize: 16.5,
            color: Colors.white,
          ),
          ),
        ),

      ),
    );
  }
}
