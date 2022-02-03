import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import "./pages/map.dart";
import "./pages/settings.dart";
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  static final HttpLink _httpLink =
      HttpLink('https://www.histories.cc/api/graphql');

  final ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: _httpLink,
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      // Remove the debug banner
      // debugShowCheckedModeBanner: false,
      title: 'histories',
      home: MyHomePage(),
    );
  }
}

// Main Screen
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MapController _mapController;
  late List<Widget> _tabs;

  @override
  void initState() {
    _mapController = MapController();
    _tabs = [
      MapPage(
        mapController: _mapController,
      ),
      const SettingsPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);

          _mapController.move(
            LatLng(position.latitude, position.longitude),
            15,
          );
        },
        child: const Icon(
          CupertinoIcons.location_fill,
        ),
      ),
      body: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.map),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                label: 'Settings',
              )
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          }),
    );
  }
}
