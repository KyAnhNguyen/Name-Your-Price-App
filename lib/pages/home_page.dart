import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 80)),
            const Text('Bluetooth mouse'),
            const Padding(padding: EdgeInsets.only(top: 40)),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(labelText: "Enter your number"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            MaterialButton(
              onPressed: () {},
              child: const Text('check', style: TextStyle(color: Colors.white),),
              color: Colors.blueAccent,
            ),

          ],
        ),
      ),
    )
    );
  }
}