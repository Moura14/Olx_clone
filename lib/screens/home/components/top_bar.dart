import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/screens/category/category_screens.dart';
import 'package:olx_mobx/screens/filter/filter_screen.dart';
import 'package:olx_mobx/screens/home/components/bar_buttons.dart';
import 'package:olx_mobx/stores/home_stores.dart';

class TopBar extends StatelessWidget {
  //const TopBar({Key key}) : super(key: key);

  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Observer(builder: (_) {
          return BarButton(
            label: homeStore.category?.description ?? "Categorias",
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[400]))),
            onTap: () async {
              final category = await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => CategoryScreens(
                          showAll: true, selected: homeStore.category)));
              if (category != null) homeStore.setCategory(category);
            },
          );
        }),
        BarButton(
          label: "Filtros",
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[400]),
                  left: BorderSide(color: Colors.grey[400]))),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => FilterScreen()));
          },
        )
      ],
    );
  }
}
