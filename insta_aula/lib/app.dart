import 'package:flutter/material.dart';
import 'pages/home_page.dart';

class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 12, 109, 155),
          brightness: Brightness.light,),
      ),
      home: const HomePage(),
    );
  }
}