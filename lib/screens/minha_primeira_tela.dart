import 'package:flutter/material.dart';

class Aula1Stack extends StatelessWidget {
  const Aula1Stack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(color: Colors.red, width: 100, height: 100),
          Container(color: Colors.blue, width: 50, height: 50),
        ],
      ),
    );
  }
}

class Aula1Column extends StatelessWidget {
  const Aula1Column({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(color: Colors.red, width: 100, height: 100),
          Container(color: Colors.blue, width: 50, height: 50),
        ],
      ),
    );
  }
}

class Aula1Row extends StatelessWidget {
  const Aula1Row({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(color: Colors.red, width: 100, height: 100),
          Container(color: Colors.blue, width: 50, height: 50),
        ],
      ),
    );
  }
}

class Aula2 extends StatelessWidget {
  const Aula2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.blue, width: 50, height: 50),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(color: Colors.blue, width: 100, height: 100),
              Container(color: Colors.red, width: 50, height: 50),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(color: Colors.cyan, width: 50, height: 50),
              Container(color: Colors.pink, width: 50, height: 50),
              Container(color: Colors.purple, width: 50, height: 50),
            ],
          ),
          Container(
            color: Colors.amber,
            width: 300,
            height: 30,
            child: const Text(
              "Diamante amarelo",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print("Apertou o botao");
            },
            child: const Text("Botao"),
          )
        ],
      ),
    );
  }
}
