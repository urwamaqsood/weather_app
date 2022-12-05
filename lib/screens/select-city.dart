import 'package:flutter/cupertino.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: ListView(
              children: [
                ListTile(
                  title: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                        hintText: 'Enter City',
                        hintStyle: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 20)),
                    controller: cityFieldController,
                    keyboardType: TextInputType.text,
                  ),
                ),
                ListTile(
                  title: TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context, {'enter': cityFieldController.text});
                    },
                    child: Text(
                      'Get Weather',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
