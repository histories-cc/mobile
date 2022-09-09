import 'package:flutter/cupertino.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Search"),
      ),
      child: Center(
        child: Text("search"),
      ),
    );
  }
}
