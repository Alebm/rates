import 'package:flutter/material.dart';
import 'package:rates/src/bloc/Prests_bloc.dart';
import 'package:rates/src/models/prest_model.dart';


class ListaPage extends StatefulWidget {

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  final prestBloc = new PrestsBloc();


  @override
  Widget build(BuildContext context) {

    prestBloc.obtenerPrests();

    return Scaffold(
      body: StreamBuilder<List<PrestModel>>(
        stream: prestBloc.prestsStream,
        builder: (BuildContext context, AsyncSnapshot<List<PrestModel>> snapshot){
          
          if ( !snapshot.hasData){
            return Center(child: CircularProgressIndicator());
            
          }

          final prests = snapshot.data;
      

          if ( prests.length == 0 ){
            return Center(child: Text('No hay prestamos'));

          }

          return ListView.builder(
            itemCount: prests.length,
            itemBuilder: (context,i)=> Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              onDismissed: (direction)=> prestBloc.borrarPrest(prests[i].id),
              child:  ListTile(
              leading: Icon(Icons.monetization_on, color: Theme.of(context).primaryColor),
              title: Text(prests[i].tipo),
              subtitle: Text(prests[i].valor),
              trailing: Icon(Icons.arrow_right),
              onTap: () => Navigator.pushNamed(context, 'prestamos'),
              
               )
              )
            );
         }
        ),
      appBar: AppBar(
        title: const Text('Prestamos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever), 
            onPressed: prestBloc.borrarPrestsTODOS,
              
            ),
        ],
      ),

    );
  }
}