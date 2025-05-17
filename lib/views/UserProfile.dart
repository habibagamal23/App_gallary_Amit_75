import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallerymobile/controllers/UserProvider.dart';
import 'package:gallerymobile/controllers/counter.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Consumer<UserProvider>(builder: (context, provider, child) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: FileImage(File(provider.userModel!.url!)),
          ),
          title: Text("${provider.userModel!.name}"),
          subtitle: Text("${provider.userModel!.Username}"),
        );
      })
    ]));
  }
}
