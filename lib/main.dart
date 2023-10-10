import 'package:flutter/material.dart';
import 'package:gdsc_task/Pages/AboutPage.dart';
import 'package:gdsc_task/Pages/HomePage.dart';
import 'package:gdsc_task/Pages/gamePage.dart';
import 'package:gdsc_task/Utils/MyRoutes.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
    routes: {
  MyRoutes.HomePage: (context) => HomePage(),
  MyRoutes.game: (context) =>game(),
  MyRoutes.AboutPage: (context) => AboutPage(),
  }


    );
  }
}
