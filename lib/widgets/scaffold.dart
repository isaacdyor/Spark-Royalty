import 'package:flutter/material.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:provider/provider.dart';
import '../state.dart';

class MyScaffold extends StatelessWidget {
  final Widget content;
  MyScaffold({
    Key? key,
    required this.content,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Consumer<AppState>(builder: (context, state, child) {
      return Scaffold(
        appBar: AdaptiveNavBar(
          screenWidth: sw,
          title: const Text("Spark Royalty"),
          navBarItems: [
            NavBarItem(
              text: "Home",
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            NavBarItem(
              text: "Search",
              onTap: () {
                Navigator.pushNamed(context, "/search");
              },
            ),
            NavBarItem(
              text: "Create",
              onTap: () {
                Navigator.pushNamed(context, "/create");
              },
            ),
          ],
        ),
        body: content,
      );
    });
  }
}
