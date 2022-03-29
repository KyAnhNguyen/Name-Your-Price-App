

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfo {
  final String name;
  final int price;
  ProductInfo(this.name, this.price);
}

final products = [
  ProductInfo('Photobook Lisa vol 1', 5),
  ProductInfo('Photobook Lisa vol 2', 5),
  ProductInfo('Photobook Lisa vol 3', 5),
  ProductInfo('Album LALISA gold ver', 5),
  ProductInfo('Album LALISA black ver', 5),
];

class HomePage extends StatefulWidget{
  const HomePage({Key? key}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State<HomePage>{

  int _curentProductIndex = 0;
  int? _inputtedPrice;
  String _result= '';
  final _inputPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 80)),
            Text(products[_curentProductIndex].name),
            const Padding(padding: EdgeInsets.only(top: 40)),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _inputPriceController,
                key: Key('priceInput'),
                decoration: InputDecoration(labelText: "Enter your expected price"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value){
                  _inputtedPrice = int.tryParse(value);
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _result = _inputtedPrice == products[_curentProductIndex].price ? 'pass' : 'fail';
                  _inputPriceController.text = '';
                });
              },
              child: const Text('check', style: TextStyle(color: Colors.white),),
              color: Colors.blueAccent,
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            MaterialButton(
              onPressed: () {
                setState(() {
                  if(_curentProductIndex < 4){
                    _curentProductIndex++;
                    _inputPriceController.text = '';
                  }
                });
              },
              child: const Text('next', style: TextStyle(color: Colors.white),),
              color: Colors.blueAccent,
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            Text(_result),
          ],
        ),
      ),
    )
    );
  }
}