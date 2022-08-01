import 'package:clinic_app/gallery/photo_model.dart';
import 'package:flutter/material.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({Key? key}) : super(key: key);
  List get photoList => [
        Photo(
            name: 'photo1',
            url:
                'https://img.freepik.com/premium-photo/long-hospital-corridor-with-empty-seats_117023-1679.jpg?w=2000'),
        Photo(
            name: 'photo2',
            url: 'https://mavihospital.com/wp-content/uploads/ameliyathane.png')
      ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: photoList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
      ),
      itemBuilder: ((context, index) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(photoList[index].url),
                  fit: BoxFit.cover)),
        );
      }),
    );
  }
}
