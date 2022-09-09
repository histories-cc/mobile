import 'package:flutter/cupertino.dart';

// screens
import 'src/screens/map.dart';
import 'src/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
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
