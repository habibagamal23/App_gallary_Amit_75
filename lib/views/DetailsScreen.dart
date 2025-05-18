import 'package:flutter/material.dart';

import '../models/ImageModel.dart';

class Detailsscreen extends StatelessWidget {
  final ImageModel imageModel;
  const Detailsscreen({super.key, required this.imageModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(imageModel.Url,
            fit: BoxFit.cover, width: double.infinity, height: double.infinity),
        Positioned(
            left: 90, right: 30, top: 30, child: Icon(Icons.favorite_border)),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return DraggableScrollableSheet(
                          initialChildSize: 0.5,
                          minChildSize: 0.2,
                          maxChildSize: 0.8,
                          expand: false,
                          builder: (_, scrollController) {
                            return ListView(
                              controller: scrollController,
                              children: [
                                Text(imageModel.decription),
                                Text(imageModel.name),
                                Text(imageModel.audioUrl),
                              ],
                            );
                          });
                    });
              },
              child: Text("OverView")),
        )
      ],
    ));
  }
}
