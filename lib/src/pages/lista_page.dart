import 'package:flutter/material.dart';
import 'package:rates/src/providers/db_provider.dart';

class ListaPage extends StatefulWidget {

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PrestModel>>(
        future: DBProvider.db.getTodosPrest(),
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
              onDismissed: (direction)=> DBProvider.db.deletePrest(prests[i].id),
              child:  ListTile(
              leading: Icon(Icons.monetization_on, color: Theme.of(context).primaryColor),
              title: Text(prests[i].valor),
              trailing: Icon(Icons.arrow_right),
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
            onPressed: (){}),
        ],
      ),

    );
  }
}