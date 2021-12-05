import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/components/drawer/page_tile.dart';
import 'package:olx_mobx/stores/page_store.dart';

class PageSection extends StatelessWidget {
  //const PageSection({Key key}) : super(key: key);

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile("Anúncios", Icons.list, () {
          pageStore.setPage(0);
        }, pageStore.page == 0),
        PageTile("Inserir anúncio", Icons.edit, () {
          pageStore.setPage(1);
        }, pageStore.page == 1),
        PageTile("Chat", Icons.chat, () {
          pageStore.setPage(2);
        }, pageStore.page == 2),
        PageTile("Favoritos", Icons.favorite, () {
          pageStore.setPage(3);
        }, pageStore.page == 3),
        PageTile("Minha conta", Icons.person, () {
          pageStore.setPage(4);
        }, pageStore.page == 4)
      ],
    );
  }
}
