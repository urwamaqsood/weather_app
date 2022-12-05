import 'package:flutter/material.dart';

import 'climate.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Current weather",
    home: Climate(),
  ));
}
