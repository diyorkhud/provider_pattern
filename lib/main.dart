import 'package:flutter/material.dart';
import 'package:provider_pattern/pages/home_page.dart';
import 'package:provider_pattern/pages/post_page.dart';
import 'package:provider_pattern/pages/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/postPage': (context) => const PostPage(),
        '/updatePage': (context) => UpdatePage(title: '', body: ''),
      },
    );
  }
}
