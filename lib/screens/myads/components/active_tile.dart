import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:olx_mobx/models/ad.dart';
import 'package:olx_mobx/helpers/extensions.dart';
import 'package:olx_mobx/screens/ad/ad_screens.dart';
import 'package:olx_mobx/screens/create/create_screens.dart';
import 'package:olx_mobx/stores/myads_stores.dart';

class ActiveTile extends StatelessWidget {
  //const ActiveTile({ Key key }) : super(key: key);
  ActiveTile(this.ad, this.stores);
  final Ad ad;
  final MyAdsStores stores;

  final List<MenuChoice> choice = [
    MenuChoice(index: 0, title: "Editar", iconData: Icons.edit),
    MenuChoice(index: 1, title: "Já vendi", iconData: Icons.thumb_up),
    MenuChoice(index: 2, title: "Excluir", iconData: Icons.delete)
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return AdScreens(ad);
        }));
      },
      child: Card(
        //arredonda o card com a imagem
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
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
              ),

              //abre um menu pelo os três pontinhos
              PopupMenuButton<MenuChoice>(
                onSelected: (choice) {
                  switch (choice.index) {
                    case 0:
                      editAd(context);
                      break;
                    case 1:
                      soldAd(context);
                      break;
                    case 2:
                      delteAd(context);
                      break;
                  }
                },
                icon: Icon(
                  Icons.more_vert,
                  size: 20,
                ),
                itemBuilder: (_) {
                  return choice
                      .map((choice) => PopupMenuItem<MenuChoice>(
                            value: choice,
                            child: Row(
                              children: [
                                Icon(
                                  choice.iconData,
                                  size: 20,
                                  color: Colors.purple,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  choice.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.purple),
                                )
                              ],
                            ),
                          ))
                      .toList();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editAd(BuildContext context) async {
    final success = await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => CreateScreens(ad: ad),
    ));
    if (success != null && success) stores.refresh();
  }

  void soldAd(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Vendido"),
              content: Text("Confirmar a venda de ${ad.title}?"),
              actions: [
                FlatButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text("Não"),
                  textColor: Colors.purple,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    stores.soldAd(ad);
                  },
                  child: Text("Sim"),
                  textColor: Colors.red,
                )
              ],
            ));
  }

  void delteAd(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Excluir"),
              content: Text("Confirmar a exclusão de ${ad.title}?"),
              actions: [
                FlatButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text("Não"),
                  textColor: Colors.purple,
                ),
                FlatButton(
                  onPressed: () {
                    stores.deletAd(ad);
                    Navigator.of(context).pop();
                  },
                  child: Text("Sim"),
                  textColor: Colors.red,
                )
              ],
            ));
  }
}

class MenuChoice {
  MenuChoice({this.index, this.title, this.iconData});

  final int index;
  final String title;
  final IconData iconData;
}
