import 'package:flutter/material.dart';
import 'package:gallerymobile/controllers/ThemeProvider.dart';
import 'package:gallerymobile/controllers/UserProvider.dart';
import 'package:gallerymobile/controllers/counter.dart';
import 'package:gallerymobile/views/LoginScreen.dart';
import 'package:gallerymobile/views/myHome.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => Counter()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:context.watch<ThemeProvider>().currentTheme,
      home: LoginScreen()
    );
  }
}
