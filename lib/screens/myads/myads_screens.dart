import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/screens/myads/components/active_tile.dart';
import 'package:olx_mobx/screens/myads/components/peding_tile.dart';
import 'package:olx_mobx/stores/myads_stores.dart';

import 'components/sold_tile.dart';

class MyAds extends StatefulWidget {
  const MyAds({Key key}) : super(key: key);

  @override
  State<MyAds> createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> with SingleTickerProviderStateMixin {
  TabController tabController;

  final MyAdsStores store = MyAdsStores();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Meus Anúncios"),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.orange,
          tabs: [
            Tab(
              child: Text("ATIVOS"),
            ),
            Tab(child: Text("PEDENTES")),
            Tab(
              child: Text("VENDIDOS"),
            )
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        Observer(builder: (_) {
          if (store.activesAds.isEmpty) return Container();
          return ListView.builder(
            itemCount: store.activesAds.length,
            itemBuilder: (_, index) {
              return ActiveTile(store.activesAds[index]);
            },
          );
        }),
        Observer(builder: (_) {
          if (store.peddingAds.isEmpty) return Container();
          return ListView.builder(
            itemCount: store.peddingAds.length,
            itemBuilder: (_, index) {
              return PedingTile(store.peddingAds[index]);
            },
          );
        }),
        Observer(builder: (_) {
          if (store.soldAds.isEmpty) return Container();
          return ListView.builder(
            itemCount: store.soldAds.length,
            itemBuilder: (_, index) {
              return SoldTile(store.soldAds[index]);
            },
          );
        })
      ]),
    );
  }
}
