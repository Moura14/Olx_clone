import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:olx_mobx/models/ad.dart';
import 'package:olx_mobx/helpers/extensions.dart';

class AdTile extends StatelessWidget {
  //const AdTile({Key key}) : super(key: key);

  AdTile(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Row(
          children: [
            SizedBox(
              height: 135,
              width: 167,
              child: CachedNetworkImage(
                imageUrl: ad.images.isEmpty
                    ? 'https://image.flaticon.com/icons/png/512/29/29072.png'
                    : ad.images.first,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ad.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ad.price.formatteMoney(),
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '${ad.created.fomrattedDate()} - '
                    '${ad.adress.city.name} - '
                    '${ad.adress.uf.initials}',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
