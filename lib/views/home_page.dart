import 'package:flutter/material.dart';
import 'package:opdracht7/views/carInfo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  String kenteken = '';

  List<RegExp> regularExpression = [
    RegExp(r"^[a-zA-Z]{2}[\d]{2}[\d]{2}"),
    RegExp(r"^[\d]{2}[a-zA-Z]{2}[\d]{2}"),
    RegExp(r"^[a-zA-Z]{2}[\d]{2}[a-zA-Z]{2}"),
    RegExp(r"^[a-zA-Z]{2}[a-zA-Z]{2}[\d]{2}"),
    RegExp(r"^[\d]{2}[a-zA-Z]{2}[a-zA-Z]{2}"),
    RegExp(r"^[\d]{2}[a-zA-Z]{3}[\d]{1}"),
    RegExp(r"^[\d]{1}[a-zA-Z]{3}[\d]{2}"),
    RegExp(r"^[a-zA-Z]{2}[\d]{3}[a-zA-Z]{1}"),
    RegExp(r"^[a-zA-Z]{1}[\d]{3}[a-zA-Z]{2}"),
    RegExp(r"^[a-zA-Z]{3}[\d]{2}[a-zA-Z]{1}"),
    RegExp(r"[a-zA-Z]{1}[\d]{2}[a-zA-Z]{3}"),
    RegExp(r"^[\d]{1}[a-zA-Z]{2}[\d]{3}"),
    RegExp(r"^[\d]{3}[a-zA-Z]{2}[d]{1}")
  ];

  isValid(String kenteken) {
    for (var i = 0; i < regularExpression.length; i++) {
      if (regularExpression[i].hasMatch(kenteken) && kenteken.length == 6) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kenteken),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kenteken',
                ),
                onSubmitted: (text) {
                  if (isValid(text)) {
                    setState(
                      () {
                        kenteken = text;
                      },
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarInfo(
                          carInfo: text.toUpperCase(),
                        ),
                      ),
                    );
                  } else {
                    setState(
                      () {
                        kenteken = 'Voer een geldig kenteken in';
                      },
                    );
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(kenteken),
            ),
          ],
        ),
      ),
    );
  }
}
