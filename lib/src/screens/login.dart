import 'package:flutter/cupertino.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Login"),
      ),
      child: Center(
        child: Text("Login form"),
      ),
    );
  }
}
