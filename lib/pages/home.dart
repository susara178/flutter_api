import 'package:flutter/material.dart';
import 'package:band_names/models/band.dart';


class HomePage extends StatefulWidget { 
  @override
    _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
   List<Band> bands = [
    Band(id: '1', name: 'Melalica', votes: 1 ),
    Band(id: '2', name: 'Queen', votes: 3 ),
    Band(id: '3', name: 'Heroes del Silencio', votes: 5 ),
    Band(id: '4', name: 'Bon jovi', votes: 4 ),
    Band(id: '5', name: 'Sytem of a dawon', votes: 9 ),
  ];


  @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title:Text('BandNames',style: TextStyle( color: Colors.black87) ),
    backgroundColor: Colors.white,
    elevation: 1,
    ),
    body: ListView.builder(
      itemCount: bands.length,
      itemBuilder: (context, i) => _bandTile( bands[i] )
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: addNewBand
    ),
  );
 }

  Widget _bandTile(Band band) {
    return Dismissible(
      key : Key (band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        print('direction: $direction');
        print('id: ${ band.id}');
        //todo: llamar el borrado en el servidor
      },
      background: Container(
        padding: EdgeInsets.only( left: 8.0 ),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Eliminar banda',style: TextStyle( color: Colors.white)),
       )
      ),
          child: ListTile(
          leading: CircleAvatar(
            child: Text(band.name.substring(0,2)),
            backgroundColor: Colors.blue[100],
          ),
          title: Text(band.name),
          trailing: Text('${band.votes}',style: TextStyle(fontSize: 20)),
          onTap: (){
            print(band.name);
          },
        ),
    );
  }
  addNewBand() {

    final textController = new TextEditingController();

     showDialog(
      context: context,
      builder: ( context ) {
       return AlertDialog(
        title: Text('Nuevo Nombre de Banda:'),
        content: TextField(
          controller: textController,
        ),
        actions:<Widget>[
          MaterialButton(
            child:Text('Add'),
            elevation: 5,
            textColor: Colors.blue,
            onPressed:(){
              print(textController.text );
            }
          )
        ],
       );
      },
    );
  }
  void addBandTolist( String name){
    print(name);

    if (name.length > 1 ) {
      //podemos agremar mas datos a la tabla
      this.bands.add( new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState((){});

    }
    Navigator.pop(context);
  }











} 