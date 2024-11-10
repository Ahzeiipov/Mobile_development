import 'package:flutter/material.dart';

String image1 = 'assets/image/image1.jpg';
String image2 = 'assets/image/image2.jpg';
String image3 = 'assets/image/image3.jpg';
String currentImg = 'assets/image/image1.jpg';
void main() {
  runApp(const MaterialApp(
    home: ImageChange(),
  ));
}

class ImageChange extends StatefulWidget {
  const ImageChange({
    super.key,
  });

  @override
  State<ImageChange> createState() => _ImageChangeState();
}

class _ImageChangeState extends State<ImageChange> {
  void exchange(int index) {
    setState(() {
      if (index == -1) {
        currentImg = (currentImg == image1)
            ? image3
            : (currentImg == image2)
                ? image1
                : image2;
        // it two condition ng ot trv so vea previous tv ti 2
      } else if (index == 1) {
        currentImg = (currentImg == image3)
            ? image1
            : (currentImg == image2)
                ? image3
                : image2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image view'),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: () {
                exchange(-1);
              },
              icon: const Icon(
                Icons.chevron_left,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                exchange(1);
              },
              icon: const Icon(
                Icons.chevron_right,
                size: 30,
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 20)),
          ],
        ),
        body: Container(
          child: Image.asset(
            currentImg,
            width: 10000,
            fit: BoxFit.cover,
          ),
        ));
  }
}
