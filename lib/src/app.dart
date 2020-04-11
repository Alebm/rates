import 'package:flutter/material.dart';
import 'package:rates/src/pages/home_page.dart';



class MyApp extends StatefulWidget{
  @override

  _MyApp createState()=>_MyApp();
}
class _MyApp extends State<MyApp> {
  
  @override
  Widget build( BuildContext context ){

    return  MaterialApp(
      home: Center(
        child: HomePage(), 
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        
      ),
    );
  }

}