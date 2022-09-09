import 'package:ferry/typed_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "src/graphql/client.dart";

// screens
import 'src/screens/map.dart';
import 'src/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: "Histories mobile",
      initialRoute: "/",
      routes: {
        "/": (_) => Map(),
        "/login": (_) => Login(),
      },
    );
  }
}
