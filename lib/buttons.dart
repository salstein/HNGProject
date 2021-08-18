import 'package:flutter/material.dart';


customBtn(color, text, goto) {
  return GestureDetector(
    onTap: () {
   
    },
    child: Container(
      height: 45.0,
      width: 275,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(50.0)),
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 24.0,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}