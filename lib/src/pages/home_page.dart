import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_providers.dart';
import 'package:componentes/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes')
      ),
      body: _lista()
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {

        return ListView(
          children: _listaItems( snapshot.data, context ),
        );

      },
    );
  }

  List<Widget> _listaItems( List<dynamic> data, BuildContext context ) {

    final List<Widget> opciones = [];
    
    data.forEach( (opcion) {

      final widgetTemp = ListTile(
        title: Text( opcion['texto'] ),
        leading: getIcon( opcion['icon'] ),
        trailing: Icon(Icons.keyboard_arrow_left, color: Colors.lightBlue),
        onTap: () {

          Navigator.pushNamed(context, opcion['ruta'] );

          // final route = MaterialPageRoute(
          //   builder: ( context ) =>  AlertPage()
          // );
          // Navigator.push(context, route);

        }
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

      

    });

    return opciones;
    
  }
}