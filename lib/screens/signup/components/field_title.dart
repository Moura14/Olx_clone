import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  FieldTitle(this.title, this.subtitle);

  final String title;
  final String subtitle;
  //const FieldTitle({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3, bottom: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text(
            "$title ",
            style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Text(
            "$subtitle ",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      ),
    );
  }
}
