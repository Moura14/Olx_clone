import 'package:flutter/material.dart';

class ImagesField extends StatelessWidget {
  const ImagesField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: GestureDetector(
              child: CircleAvatar(
                radius: 44,
                backgroundColor: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
