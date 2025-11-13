import 'package:flutter/material.dart';

class Listview1 extends StatefulWidget {
  const Listview1({super.key});

  @override
  State<Listview1> createState() => _Listview12();
}

class _Listview12 extends State<Listview1> {
  String textoMuestra = '0';
  String operacionActual = '';
  bool reiniciarScreen = false;
  double primerOperador = 0;
  bool segundoOp = false;

  void numeroClicado(String number) {
    setState(() {
      if (segundoOp || textoMuestra == '0') {
        textoMuestra = number;
        segundoOp = false;
      } else {
        textoMuestra += number;
      }
    });
  }

  void operacionesClicada(String operacion) {
    setState(() {
      primerOperador = double.parse(textoMuestra);
      operacionActual = operacion;
      segundoOp = true;
    });
  }

  void calculadora() {
    setState(() {
      if (operacionActual.isEmpty) return;

      double segundoOperador = double.parse(textoMuestra);
      double resultado = 0;
      switch (operacionActual) {
        case '+':
          resultado = primerOperador + segundoOperador;
          break;
        case '-':
          resultado = primerOperador - segundoOperador;
          break;
        case 'x':
          resultado = primerOperador * segundoOperador;
          break;
        case '/':
          if (segundoOperador != 0) {
            resultado = primerOperador / segundoOperador;
          } else {
            textoMuestra = "Error";
            operacionActual = '';
            return;
          }
          break;
      }
      textoMuestra = resultado.toDouble().toString();

      primerOperador = resultado;
      segundoOp = true;
      operacionActual = '';
    });
  }

  void porcentaje() {
    setState(() {
      double valor = double.parse(textoMuestra);
      double resultado = valor / 100;

      if (resultado == resultado.toDouble()) {
        textoMuestra = resultado.toDouble().toString();
      } else {
        textoMuestra = resultado.toString();
      }
    });
  }

  void decimal() {
    setState(() {
      if (!textoMuestra.contains('.')) {
        textoMuestra += ".";
      }
    });
  }

  void signo() {
    setState(() {
      double resultado = 0;
      double valor = double.parse(textoMuestra);
      if (!textoMuestra.contains('-')) {
        resultado = valor * -1;
        textoMuestra = resultado.toString();
      } else {
        resultado = valor.abs();
        textoMuestra = resultado.toString();
      }
    });
  }

  //Borrar CE
  void borrar() {
    setState(() {
      textoMuestra = '0';
    });
  }

  void borrarUltimo() {
    setState(() {
      if (textoMuestra.length > 1) {
        textoMuestra = textoMuestra.substring(0, textoMuestra.length - 1);
      } else {
        textoMuestra = '0';
      }
    });
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.pressed)) {
          //Color cuando es presionado
          return const Color.fromRGBO(224, 170, 255, 1);
        }
        return Color.fromRGBO(199, 125, 255, 1);
      }),
      foregroundColor: WidgetStateProperty.all(
        const Color.fromARGB(255, 0, 0, 0),
      ),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      elevation: WidgetStateProperty.all(1),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estandar'),
        backgroundColor: Color.fromRGBO(157, 78, 221, 1),
        leading: Icon(Icons.menu, color: const Color.fromARGB(255, 0, 0, 0)),
        titleTextStyle: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //pantalla de la calculadora
            Container(
              height: 150,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.all(40.0),
              child: Text(
                textoMuestra,
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //botones de la calculadora
            Expanded(
              child: Row(
                children: <Widget>[
                  //columna 1
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              porcentaje();
                            },
                            child: Text('%'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              numeroClicado('7');
                            },
                            child: Text('7'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              numeroClicado('4');
                            },
                            child: Text('4'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              numeroClicado('1');
                            },
                            child: Text('1'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              signo();
                            },
                            child: Text('+/-'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //columna 2
                  Expanded(
                    child: Column(
                      children: [
                        //boton 1
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              borrar();
                            },
                            child: Text('CE'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              numeroClicado('8');
                            },
                            child: Text('8'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              numeroClicado('5');
                            },
                            child: Text('5'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              numeroClicado('2');
                            },
                            child: Text('2'),
                          ),
                        ),
                        //Boton 5
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              numeroClicado('0');
                            },
                            child: Text('0'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Columna 3
                  Expanded(
                    child: Column(
                      children: [
                        //boton 1
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              borrarUltimo();
                            },
                            child: Text('C'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              numeroClicado('9');
                            },
                            child: Text('9'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              numeroClicado('6');
                            },
                            child: Text('6'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              numeroClicado('3');
                            },
                            child: Text('3'),
                          ),
                        ),
                        //Boton 5
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              decimal();
                            },
                            child: Text(','),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //columna 4
                  Expanded(
                    child: Column(
                      children: [
                        //boton 1
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              operacionesClicada("/");
                            },
                            child: Text('/'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              operacionesClicada("x");
                            },
                            child: Text('x'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              operacionesClicada("-");
                            },
                            child: Text('-'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              operacionesClicada("+");
                            },
                            child: Text('+'),
                          ),
                        ),
                        //Boton 5
                        Expanded(
                          child: ElevatedButton(
                            style: _buttonStyle(),
                            onPressed: () {
                              calculadora();
                            },
                            child: Text('='),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(157, 78, 221, 1),
    );
  }
}
