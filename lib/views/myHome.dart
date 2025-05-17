import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gallerymobile/controllers/ThemeProvider.dart';
import 'package:gallerymobile/controllers/counter.dart';
import 'package:provider/provider.dart';

import 'UserProfile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserProfile()));
                },
                icon: Icon(Icons.person)),
            IconButton(
                onPressed: () {
                  context.read<ThemeProvider>().ToggleTheme();
                },
                icon: Icon(context.watch<ThemeProvider>().isDark
                    ? Icons.dark_mode
                    : Icons.light_mode))
          ],
        ),
        body: Text(
          "home",
          style: TextStyle(color: Colors.green),
        ));
  }
}
