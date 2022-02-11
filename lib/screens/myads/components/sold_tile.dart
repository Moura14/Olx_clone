import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:olx_mobx/models/ad.dart';
import 'package:olx_mobx/helpers/extensions.dart ';
import 'package:olx_mobx/stores/myads_stores.dart';

class SoldTile extends StatelessWidget {
  //const SoldTile({ Key? key }) : super(key: key);

  SoldTile(this.ad, this.stores);
  final Ad ad;
  final MyAdsStores stores;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Container(
        height: 80,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: ad.images.isEmpty
                    ? 'https://image.flaticon.com/icons/png/512/29/29072.png'
                    : ad.images.first,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ad.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Text(
                      ad.price.formatteMoney(),
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            Column(children: [
              IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.purple,
                  iconSize: 20,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text("Excluir"),
                            content: Text("Confirmar a venda de ${ad.title}"),
                            actions: [
                              FlatButton(
                                onPressed: Navigator.of(context).pop,
                                child: Text("Não"),
                                textColor: Colors.purple,
                              ),
                              FlatButton(
                                child: Text("Sim"),
                                textColor: Colors.red,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  stores.deletAd(ad);
                                },
                              )
                            ],
                          );
                        });
                  })
            ])
          ],
        ),
      ),
    );
  }
}
