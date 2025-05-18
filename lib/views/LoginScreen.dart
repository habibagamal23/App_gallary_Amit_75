import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../controllers/UserProvider.dart';
import 'myHome.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final usernameCtrl = TextEditingController();
    final image = context.watch<UserProvider>().image;
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          InkWell(
            onTap: () {
              context.read<UserProvider>().pickImage();
            },
            child: CircleAvatar(
              radius: 50,
              child:
                  image == null ? Icon(Icons.person) : Image.file(File(image!)),
            ),
          ),
          // NAME & USERNAME FIELDS
          TextField(
            controller: nameCtrl,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: usernameCtrl,
            decoration: InputDecoration(labelText: 'Username'),
          ),

          SizedBox(height: 20),

          // SAVE & GO
          ElevatedButton(
            onPressed: () {
              context.read<UserProvider>().saveUser(
                    nameCtrl.text.trim(),
                    usernameCtrl.text.trim(),
                  );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MyHomePage(),
                ),
              );
            },
            child: Text(
              'Save ',
            ),
          ),
        ]),
      ),
    );
  }
}
