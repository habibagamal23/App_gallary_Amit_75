import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gallerymobile/controllers/ThemeProvider.dart';
import 'package:gallerymobile/controllers/counter.dart';
import 'package:gallerymobile/views/DetailsScreen.dart';
import 'package:provider/provider.dart';

import '../controllers/ImageProvider.dart';
import 'UserProfile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<ImageProviderr>().items;

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
        body: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: (){
                  Navigator.push(context , MaterialPageRoute(builder: (context)=>Detailsscreen(imageModel: items[index])));
                },
                  title: Text(items[index].name),
                  subtitle: Text(items[index].decription),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(items[index].Url),
                  ));
            }));
  }
}
