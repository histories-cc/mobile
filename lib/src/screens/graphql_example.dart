import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/cupertino.dart';
import "../graphql/client.dart";

class Map extends StatelessWidget {
  Map({super.key});
  final client = initClient(
      "https://4000-historiescc-backend-okexg6e89af.ws-eu64.gitpod.io/");
  final helloReq = GHelloReq();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Map"),
      ),
      child: Center(
        child: Operation(
          client: client,
          operationRequest: helloReq,
          builder: (context, response, error) {
            if (response == null ||
                error != null ||
                response.data == null ||
                response.loading) {
              return const Text("Loading...");
            }

            if (response.data?.hello == null) {
              return const Text("No data");
            }
            return Text(response.data?.hello ?? "___");
          },
        ),
      ),
    );
  }
}
