import 'package:flutter/material.dart';
import 'package:zuriproject/pages/splash.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HNG',
      theme: ThemeData(
        
        primarySwatch: Colors.pink,
  
       
      ),
       home: Splashscreen(),
    );
     
    
  }
}