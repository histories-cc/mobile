import 'package:flutter/cupertino.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Map"),
      ),
      child: Center(
        child: Text("All Recipes"),
      ),
    );
  }
}
