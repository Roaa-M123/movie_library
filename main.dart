


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roaa/utils/cache_helper.dart';

import 'movie_app/home_page.dart';

void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Cachehelper.initCacheHelper(); //without take object from class
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     systemNavigationBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.light,
  //     systemNavigationBarIconBrightness: Brightness.light,
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool obscureKey = true;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cardColor: Colors.white,
          secondaryHeaderColor: Colors.pinkAccent[200]!
        ),
        home : HomePage());
  }
}