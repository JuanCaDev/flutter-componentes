import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _txtEmail = '';
  String _txtPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 10, vertical: 20 ),
        children: <Widget>[
          _input(),
          Divider(),
          _email(),
          Divider(),
          _password(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _input() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('${ _nombre.length } Letras'),
        hintText: 'Ingresa tu nombre',
        labelText: 'Nombre',
        helperText: 'Nombre de la persona',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
          print(_nombre);
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Mi nombre es $_nombre'),
      subtitle: Text('Email: $_txtEmail'),
    );
  }

  Widget _email() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Ingresa tu correo',
        labelText: 'Correo electrónico',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor) {
        setState(() {
          _txtEmail = valor;
          print(_txtEmail);
        });
      },
    );
  }

  Widget _password() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Ingresa tu contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.lock_outline )
      ),
      onChanged: (valor) {
        setState(() {
          _txtEmail = valor;
          print(_txtEmail);
        });
      },
    );
  }
}