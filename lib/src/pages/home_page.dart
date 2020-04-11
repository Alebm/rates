import 'package:flutter/material.dart';
import 'package:rates/src/pages/calculos_page.dart';
import 'package:rates/src/pages/lista_page.dart';
import 'package:rates/src/pages/prestamos_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: callpage(currentIndex),
        bottomNavigationBar: _bottomNavigation(context),   

        );
  }

  Widget callpage(int paginaActual){

    switch(paginaActual){

      case 0: return Calculos();
      case 1: return ListaPage();
      case 2: return Prestamos();
      default: return Calculos();

    }

  }

  Widget _bottomNavigation(BuildContext context){

      return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },

        items: <BottomNavigationBarItem>[ 
          BottomNavigationBarItem(
            icon: Icon(Icons.euro_symbol),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.donut_large),
            title: Container(),
          ),
        ] ,
      );

  }
}