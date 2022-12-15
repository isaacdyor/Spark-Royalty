import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_royalty/state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Consumer<AppState>(
              builder: (context, trial, child) =>
                  Column(children: const [Text("Home")])),
        ],
      ),
    );
  }
}
