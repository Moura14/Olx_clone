import 'package:flutter/material.dart';
import 'package:olx_mobx/models/ad.dart';
import 'package:olx_mobx/helpers/extensions.dart';

class MainPanel extends StatelessWidget {
  //const MainPanel({Key key}) : super(key: key);

  MainPanel(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24, bottom: 14),
          child: Text(
            ad.price.formatteMoney(),
            style: TextStyle(
                fontSize: 34,
                letterSpacing: 2.8,
                fontWeight: FontWeight.w300,
                color: Colors.grey[800]),
          ),
        ),
        Text(
          ad.title,
          style: TextStyle(
              fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 18),
          child: Text(
            'Publicado em ${ad.created.fomrattedDate()}',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
        )
      ],
    );
  }
}
