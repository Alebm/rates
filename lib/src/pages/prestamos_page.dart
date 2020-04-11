import 'package:flutter/material.dart';


class Prestamos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Prestamos'),
      ),
        body: SingleChildScrollView(
            child: Column(
            children: <Widget>[
              _estructura(),
              estructurac(),
            ],
          ),
        ),
    );
  }

  Widget _estructura (){
    return Stack(
      children: <Widget>[
        _csaldo(),
        _lsaldo(),
      ],
    );
  }

  Widget _csaldo() {
    return Container(
      height: 200.0,
      color: Colors.blue,
    );
  }

  Widget _lsaldo() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 50.0,bottom: 50.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text('0.0', style: TextStyle(color: Colors.white, fontSize: 20.0,fontWeight: FontWeight.bold),),
            Text('Saldo', style: TextStyle(color: Colors.white, fontSize: 15.0,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            Text('0.0', style: TextStyle(color: Colors.white, fontSize: 20.0,fontWeight: FontWeight.bold),),
            Text('Intereses',style: TextStyle(color: Colors.white, fontSize: 15.0,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }

  Widget estructurac (){
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
          columns: <DataColumn>[
                DataColumn(label: Text("Mes"),numeric: true),
                DataColumn(label: Text("Cuota"),numeric: true),
                DataColumn(label: Text("Capital"),numeric: true),
                DataColumn(label: Text("Interes"),numeric: true),
                DataColumn(label: Text("Saldo"),numeric: true),
                DataColumn(label: Text("Pago")),
             ], 
          rows: <DataRow>[
                DataRow(cells: [
                  DataCell(Text("1")),
                  DataCell(Text("10000")),
                  DataCell(Text("1000")),
                  DataCell(Text("2000")),
                  DataCell(Text("7000")),
                  DataCell(Checkbox(value: false, onChanged: null))
                ]),
             ],
          ),
    );
  }
}