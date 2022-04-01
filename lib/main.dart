import 'package:armario/screens/intro/intro_body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xffC69F62),
          onPrimary: Color(0xff1E1F1E),
          secondary: Color(0xffC69F62),
          onSecondary: Colors.white,
          error: Color(0xfffa817d),
          onError: Colors.white,
          background: Colors.white,
          onBackground: Color(0xff1E1F1E),
          surface: Colors.white,
          onSurface: Color(0xff1E1F1E),
        ),
      ),
      home: const IntroBody(),
    );
  }
}
