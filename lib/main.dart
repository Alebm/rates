import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


//nosotros escribimos
import 'package:rates/src/app.dart';


void main() {
  
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.blue
));

  

}