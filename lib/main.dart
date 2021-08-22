import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

TextEditingController nome = TextEditingController();
TextEditingController altura = TextEditingController();
TextEditingController peso = TextEditingController();

String msg = "";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplicativo IMD" ,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: Home(),
    );

  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Aplicativo IMC"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Image.network("https://pt.calcuworld.com/wp-content/uploads/sites/6/2019/07/imc-.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nome,
                decoration: InputDecoration(
                  labelText: "Nome" ,
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: altura,
                decoration: InputDecoration(
                    labelText: "Altura" ,
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: peso,
                decoration: InputDecoration(
                    labelText: "Peso" ,
                    border: OutlineInputBorder()
                ),
              ),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
                onPressed:(){
                  final imc = double.parse(peso.text) / (double.parse(altura.text) * double.parse(altura.text));
                  setState(() {
                    msg = "Olá ${nome.text} seu IMC é: ${imc.toStringAsFixed(2)}, você está ${estado(imc)}";
                  });
                },
              textColor: Colors.white,
              color: Colors.lightBlueAccent,
              child: Text("Calcular"),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(msg),
            )
            ],
        ),
      ),
    );
  }
  String estado(double valor){
    if (valor <= 18.5){
      return "Abaixo do Peso";
    } if (valor > 18.5 && valor < 24.9){
      return "Peso normal";
    } else {
      return "Acima do peso";
    }
  }
}


