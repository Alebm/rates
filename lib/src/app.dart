import 'package:flutter/material.dart';
import 'package:rates/src/pages/home_page.dart';
import 'package:rates/src/pages/prestamos_page.dart';



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
      initialRoute: 'home',
      routes: {
        'home'      : (BuildContext context) => HomePage(),
        'prestamos' : (BuildContext context) => Prestamos(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        
      ),
    );
  }

}