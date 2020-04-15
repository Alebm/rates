import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rates/src/bloc/Prests_bloc.dart';
import 'package:rates/src/models/prest_model.dart';


class Calculos extends StatefulWidget {
  @override
  CalculosPage createState() => CalculosPage();

}

  class CalculosPage extends State<Calculos>{  

    final prestsBloc = PrestsBloc();

    // String _prestamo='',_tasa='',_plazo='',_opcionSeleccionada='Mensual Vencida';
    final List<String> _dtasas = ['Efectiva Anual','Anual Anticipada','Bimestral Vencida','Bimestral Anticipada','Trimestral Vencida','Trimestral Anticipada','Semestral Vencida','Semestral Anticipada'];
    String nomPrest, _opcionSeleccionada='Efectiva Anual', prueba = 'prueba';
    double _cuota=0,_prestamo=0,_tasa=0,_plazo=0,_mv=0,_av,_vfinal=0,_vintereses=0;
    TextEditingController prestamo = TextEditingController();
    TextEditingController tasa = TextEditingController();
    TextEditingController plazo = TextEditingController();
    TextEditingController cuota = TextEditingController();


    void addDatos(){
      setState(() {
        _prestamo = double.parse(prestamo.text);
        _tasa = double.parse(tasa.text);
        _plazo = double.parse(plazo.text);
        if(_opcionSeleccionada == 'Efectiva Anual'){
          _tasa = _tasa/100;
          _mv = pow((1+_tasa), (1/12))-1;
          _cuota = _prestamo*(_mv*(pow((1+_mv),_plazo)))/((pow((1+_mv),_plazo)-1));
          _vfinal = _cuota*_plazo;
          _vintereses = _vfinal-_prestamo;
        }else if(_opcionSeleccionada == 'Anual Anticipada'){
          _tasa = _tasa/100;
          _av = _tasa/(1-_tasa);
          _mv = _av/12;
          _cuota = _prestamo*(_mv*(pow((1+_mv),_plazo)))/((pow((1+_mv),_plazo)-1));
          _vfinal = _cuota*_plazo;
          _vintereses = _vfinal-_prestamo;
        }else if(_opcionSeleccionada == 'Bimestral Vencida'){
          _tasa = _tasa/100;
          _mv = pow((1+_tasa), (1/6))-1;
          _cuota = _prestamo*(_mv*(pow((1+_mv),_plazo)))/((pow((1+_mv),_plazo)-1));
          _vfinal = _cuota*_plazo;
          _vintereses = _vfinal-_prestamo;
        }
       
      });
    }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Calculos'), 

        ),
        body: ListView( 
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            _crearInpunt(),
            _inputTasa(),
            _inputPlazo(),
            _crearDropDown(),
            _crearBoton(),
            _crearBotonG(),


            _vprestamo(), 
            _vTasa(),
            _vplazo(),
            _vcuota(),
            _vFinal(),
            _vIntereses(),
          ],
        ),
      );
  }



Widget _crearInpunt() {

  return Container(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: TextField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0)
        ),
        hintText: 'Valor del Prestamo',
        labelText: 'Prestamo',

        suffixIcon: Icon(Icons.attach_money),
      ),
      controller: prestamo,
      // voy a probar con controller: ,
      // onChanged: (String valor){
      //   setState(() {
      //     _prestamo = valor;
      //   });
      // },
    ),
  );
}

Widget _inputTasa() {

  return Container(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: TextField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0)
        ),
        hintText: 'Valor del Tasa',
        labelText: 'Tasa',
        suffixIcon: Icon(Icons.monetization_on),
      ),
      controller: tasa,
      // voy a probar con controller: ,
      // onChanged: (String valor){
      //   setState(() {
      //     _tasa = valor;
      //   });
      // },
    ),
  );
}

Widget _inputPlazo() {

  return Container(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: TextField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0)
        ),
        hintText: 'Plazo en meses',
        labelText: 'Plazo',
        suffixIcon: Icon(Icons.access_time),
      ),
      controller: plazo,
      // voy a probar con controller: ,
      // onChanged: (String valor){
      //   setState(() {
      //     _plazo = valor;
      //   });
      // },
    ),
  );
}

List<DropdownMenuItem<String>> getOpcionesDropDown(){

  List<DropdownMenuItem<String>> lista =  List();

  _dtasas.forEach((dtasa){

    lista.add(DropdownMenuItem(
      child: Text(dtasa),
      value: dtasa,
    ));
  });

  return lista;
}



 Widget _vprestamo() {

    return ListTile(
      title: Text('Prestamo es:'),
      subtitle: Text('$_prestamo'),
    );
  }

 Widget _vTasa() {

    return ListTile(
      title: Text('La tasa es:'),
      subtitle: Text('$_tasa'),
      trailing: Text(_opcionSeleccionada),
    );
  }

 Widget _vplazo() {

    return ListTile(
      title: Text('El Plazo es:'),
      subtitle: Text('$_plazo'),
    );
  }

 Widget _vcuota() {
    return ListTile(
      title: Text('La Cuota es:'),
      subtitle: Text('$_cuota'),
    );
  }

 Widget _vFinal() {
    return ListTile(
      title: Text('Valor Final del Prestamo:'),
      subtitle: Text('$_vfinal'),
    );
  }

 Widget _vIntereses() {
    return ListTile(
      title: Text('Valor Intereses:'),
      subtitle: Text('$_vintereses'),
    );
  }

 Widget _crearDropDown() {

    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0),
      child: DropdownButton<String>(
        value: _opcionSeleccionada,
        items: getOpcionesDropDown(), 
        onChanged: (String value) {
          setState(() {
            _opcionSeleccionada = value;
          });
        },        
      ),
    );
  }

 Widget _crearBoton() {
    return Center(
      child: FlatButton(
        shape: const StadiumBorder(),
        textColor: Colors.white,
        color: Colors.blue,
        child: const Text('Calcular'),
        onPressed: (){
          addDatos();
        }
        ),
    );
  }
 Widget _crearBotonG() {
       return Center(
        child: FlatButton(
          shape: const StadiumBorder(),
          textColor: Colors.white,
          color: Colors.blue,
          child: const Text('Guardar'),
          onPressed: () {_guardarP(context);}
        ),
    );
 }


    _mensaje(BuildContext context){

      const SnackBar gsnackbar = SnackBar(content: Text('Guardado en listado'));
      _scaffoldKey.currentState.showSnackBar(gsnackbar);
      //Scaffold.of(context).showSnackBar(gsnackbar);

    }

    _guardarP(BuildContext context){

    return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context){
      return  AlertDialog(
        title: const Text('Guardar'),
        content: TextField(
          onChanged: (text) {
            setState(() {
            nomPrest = text;
            });
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'Nombre del prestamo'
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Cancelar'),
            onPressed: (){
              Navigator.pop(context);  
            },
          ),
          FlatButton(
            child: const Text('Guardar'),
            onPressed: (){
              Navigator.pop(context);
              _mensaje(context);
              _guardarPrest(context);
              //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListaPage()));
            },
          )
        ],
      ); 
    }
  );
 }

  _guardarPrest(BuildContext context) async {
    print('nomPrest: $nomPrest');

    if(nomPrest != null ){
      final prest = PrestModel(tipo: nomPrest, valor: '$_prestamo');
      prestsBloc.agregarPrests(prest);

    }
    
  }
}