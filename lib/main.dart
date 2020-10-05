import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akacalculat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Akacalculat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String hasil1 = "0";
  String hasil2 = "0";
  double nilai1 = 0;
  double nilai2 = 0;
  String operasi = "";

  buttonPressed(String buttonText) {
    if (buttonText == "HAPUS") {
      hasil2 = "0";
      nilai1 = 0;
      nilai2 = 0;
      operasi = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      nilai1 = double.parse(hasil1);

      operasi = buttonText;

      hasil2 = "0";
    } else if (buttonText == ".") {
      if (hasil2.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        hasil2 = hasil2 + buttonText;
      }
    } else if (buttonText == "=") {
      nilai2 = double.parse(hasil1);

      if (operasi == "+") {
        hasil2 = (nilai1 + nilai2).toString();
      }
      if (operasi == "-") {
        hasil2 = (nilai1 - nilai2).toString();
      }
      if (operasi == "X") {
        hasil2 = (nilai1 * nilai2).toString();
      }
      if (operasi == "/") {
        hasil2 = (nilai1 / nilai2).toString();
      }

      nilai1 = 0;
      nilai2 = 0;
      operasi = "";
    } else {
      hasil2 = hasil2 + buttonText;
    }

    print(hasil2);

    setState(() {
      hasil1 = double.parse(hasil2).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(hasil1,
                    style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
            new Expanded(
              child: new Divider(),
            ),
            new Column(children: [
              new Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("+")
              ]),
              new Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("/")
              ]),
              new Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ]),
              new Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("X")
              ]),
              new Row(children: [
                buildButton("HAPUS"),
                buildButton("="),
              ])
            ])
          ],
        )));
  }
}
