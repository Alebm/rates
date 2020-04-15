import 'dart:async';

import 'package:rates/src/providers/db_provider.dart';

class PrestsBloc{

  static final PrestsBloc _singleton = new PrestsBloc._internal();

  factory PrestsBloc(){
    return _singleton;
  }

  PrestsBloc._internal(){
    obtenerPrests();
    //Obtener Prestamo de la base de datos
  }

  final _prestContoller = StreamController<List<PrestModel>>.broadcast();

  Stream<List<PrestModel>> get prestsStream => _prestContoller.stream;

  dispose(){
    _prestContoller?.close();

  }

  obtenerPrests() async {
    _prestContoller.sink.add( await DBProvider.db.getTodosPrest() );
  }

  agregarPrests(PrestModel nuevoPrest) async{
    await DBProvider.db.nuevoPrest(nuevoPrest);
    // obtenerPrests();
  }

  borrarPrest(int id) async{
    await DBProvider.db.deletePrest(id);
    obtenerPrests();
  } 

  borrarPrestsTODOS() async{
    await DBProvider.db.deleteAll();
    obtenerPrests();
  }



}