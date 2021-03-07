import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() {
    return _controlesState();
  }
}

class _controlesState extends State<ContadorPage> {
  final _estilo = new TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  final limiteT = 10;
  final limiteB = -10;
  int _positionY = 0;
  int _actualPosition = 0;

  String cadena = '';
  String alerta = '';

  void instructionsCenter() => {
    setState(() {
      _positionY = 0;
      _actualPosition = 0;
      cadena = 'Regresó al Inicio';
      alerta = '';
    })
  };

  void instructionsTop() => {
    setState(() {
      _positionY++;

      if (_positionY >= limiteT) {
        _positionY = 10;
        alerta = 'Salió de la Pantalla ↑';
      }
    })
  };

  void instructionsBottom() => {
    setState(() {
      _positionY--;

      if (_positionY <= limiteB) {
        _positionY = 0;
        alerta = 'Salió de la Pantalla ↓';
      }
    })
  };

  void instructionRight() => {
    setState(() {
      _actualPosition++;

      if (_actualPosition > 3) _actualPosition = 0;

      switch (_actualPosition) {
        case 0:
          {
            cadena = 'Norte';
            break;
          }
        case 1:
          {
            cadena = 'Este';
            break;
          }
        case 2:
          {
            cadena = 'Sur';
            break;
          }
        case 3:
          {
            cadena = 'Oeste';
            break;
          }
      }
    })
  };

  void instructionLeft() => {
    setState(() {
      _actualPosition--;
      if (_actualPosition < 0) _actualPosition = 3;

      switch (_actualPosition) {
        case 0:
          {
            cadena = 'Norte';
            break;
          }
        case 1:
          {
            cadena = 'Este';
            break;
          }
        case 2:
          {
            cadena = 'Sur';
            break;
          }
        case 3:
          {
            cadena = 'Oeste';
            break;
          }
      }
    })
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica2'),
        centerTitle: true,
      ),
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 50,
          mainAxisSpacing: 50,
          crossAxisCount: 3,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
            ),
            FlatButton(
                child: Icon(Icons.arrow_circle_up_outlined), onPressed: instructionsTop),
            Container(
              padding: const EdgeInsets.all(8),
            ),
            FlatButton(
                child: Icon(Icons.explore_outlined), onPressed: instructionLeft),
            FlatButton(
                child: Icon(Icons.control_camera_sharp), onPressed: instructionsCenter),
            FlatButton(
                child: Icon(Icons.explore_outlined), onPressed: instructionRight),
            Container(
              padding: const EdgeInsets.all(8),
            ),
            FlatButton(
                child: Icon(Icons.arrow_circle_down_outlined),
                onPressed: instructionsBottom),
            Container(
              padding: const EdgeInsets.all(8),
            ),
            Text('$cadena'),
            Container(
              padding: const EdgeInsets.all(8),
            ),
            Text('$alerta')
          ]),
    );
  }
}
