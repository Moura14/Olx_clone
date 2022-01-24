import 'package:flutter/material.dart';
import 'package:olx_mobx/models/ad.dart';
import 'package:olx_mobx/helpers/extensions.dart';

class UserPanel extends StatelessWidget {
  //const UserPanel({Key key}) : super(key: key);

  final Ad ad;

  UserPanel(this.ad);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 18),
          child: Text(
            "Anunciante",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                ad.user.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Na olx desde ${ad.user.createdAt.fomrattedDate()}",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        )
      ],
    );
  }
}
