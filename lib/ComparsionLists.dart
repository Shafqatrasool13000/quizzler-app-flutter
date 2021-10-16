import 'package:flutter/material.dart';

class MyAppTake extends StatefulWidget {
  @override
  _MyAppTakeState createState() => _MyAppTakeState();
}

int number = 0;
bool value = false;

class _MyAppTakeState extends State<MyAppTake> {
  List<Icon> icons = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton(
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    icons.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  });
                },
                child: Text('True')),
            FlatButton(
              color: Colors.green,
              onPressed: () {
                setState(() {
                  icons.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                });

              },
              child: Text('False'),
            ),
            Row(
              children: icons,
            )
          ],
        ),
      ),
    );
  }
}
