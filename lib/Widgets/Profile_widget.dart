import 'package:flutter/material.dart';

class Profile_widget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;
  const Profile_widget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          buildIcon(),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 90,
          height: 90,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.white)),
        child: Icon(
          color: Colors.black,
          Icons.edit,
        ),
      ),
    );
  }
}
