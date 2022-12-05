import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/utils/utils.dart' as utils;

import 'select-city.dart';

class Climate extends StatefulWidget {
  const Climate({Key? key}) : super(key: key);

  @override
  _ClimateState createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  var cityEntered;

  Future goToNextScreen(BuildContext context) async {
    Map? result = await Navigator.of(context)
        .push(MaterialPageRoute<Map>(builder: (BuildContext context) {
      return SelectCity();
    }));

    if (result != null && result.containsKey('enter')) {
      cityEntered = result['enter'];
    } else {
      print('nothing');
    }
  }

  // void showweather() async {
  //   Map data = await getWeather(utils.appId, utils.defaultCity);
  //   print(data.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              goToNextScreen(context);
            },
            icon: Icon(Icons.menu),
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'images/umbrella.jpg',
              fit: BoxFit.fill,
              width: 490.0,
              height: 1200.0,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0, 10.9, 20.9, 0),
            child: Text(
              '${cityEntered}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset('images/clouds.webp'),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30.0, 390.0, 0.0, 0.0),
            child: updateTempWidget(cityEntered),
          )
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city) async {
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${utils.appId}&units=metric';
    http.Response response = await http.get(Uri.parse(apiUrl));
    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    return FutureBuilder(
        future:
            getWeather(utils.appId, city == null ? utils.defaultCity : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data as Map;
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        content['main']['temp'].toString() + "\u00B0c",
                        style: TextStyle(
                            fontSize: 43.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      subtitle: ListTile(
                        title: Text(
                          "Humidity: ${content['main']['humidity'].toString()}\n"
                          "Min: ${content['main']['temp_min'].toString()}\n"
                          "Max: ${content['main']['temp_max'].toString()}",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Container(
              child: Text('Some Error'),
            );
          }
        });
  }
}
