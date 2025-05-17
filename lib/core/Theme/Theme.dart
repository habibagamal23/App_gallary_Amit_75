import 'package:flutter/material.dart';
class ThemeCustom{

 static ThemeData lightTheme=ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.pink,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white10,
        fontSize: 20
      ),
    )
  );

 static ThemeData darkTheme=ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey,
      textTheme: TextTheme(
        titleLarge: TextStyle(
            color: Colors.pink,
            fontSize: 20
        ),
      )
  );

}