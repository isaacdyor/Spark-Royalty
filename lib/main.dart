import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_royalty/pages/detail.dart';
import 'package:spark_royalty/pages/edit.dart';
import 'package:spark_royalty/pages/home.dart';
import 'package:spark_royalty/state.dart';
import 'package:spark_royalty/pages/create.dart';
import 'package:spark_royalty/pages/search.dart';
import 'package:spark_royalty/widgets/scaffold.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyScaffold(content: const HomePage()),
        '/search': (context) => MyScaffold(content: SearchPage()),
        '/create': (context) => MyScaffold(content: CreatePage()),
        '/edit': (context) => MyScaffold(content: EditPage()),
        '/detail': (context) => MyScaffold(content: const DetailPage()),
      },
    );
  }
}
