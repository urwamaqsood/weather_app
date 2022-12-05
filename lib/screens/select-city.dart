import 'package:flutter/material.dart';

class SelectCity extends StatefulWidget {
  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  var cityFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text('Change City'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
              child: Image.asset(
            'images/weather.jpg',
            width: 490.0,
            height: 1200.0,
            fit: BoxFit.fill,
          )),
          ListView(
            children: [
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter City',
                  ),
                  controller: cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: TextButton(
                  onPressed: () {
                    Navigator.pop(context, {'enter': cityFieldController.text});
                  },
                  child: Text('Get Weather'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
