import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:olx_mobx/models/ad.dart';
import 'package:olx_mobx/helpers/extensions.dart';

class ActiveTile extends StatelessWidget {
  //const ActiveTile({ Key key }) : super(key: key);
  ActiveTile(this.ad);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 80,
        child: Row(
          children: [
            SizedBox(
              height: 135,
              width: 127,
              child: CachedNetworkImage(
                imageUrl: ad.images.isEmpty
                    ? 'https://image.flaticon.com/icons/png/512/29/29072.png'
                    : ad.images.first,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    ad.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ad.price.formatteMoney(),
                    style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                  ),
                  Text(
                    '${ad.view} visitas',
                    style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
