import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  // const SectionTitle({Key key}) : super(key: key);

  SectionTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.purple, fontSize: 13, fontWeight: FontWeight.w400),
      ),
    );
  }
}
