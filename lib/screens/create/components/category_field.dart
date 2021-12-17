import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/screens/category/category_screens.dart';
import 'package:olx_mobx/stores/create_stores.dart';

class CategoryField extends StatelessWidget {
  //const CategoryField({ Key key }) : super(key: key);

  final CreateStores createStores;
  CategoryField(this.createStores);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListTile(
          title: createStores.category == null
              ? Text(
                  'Categoria *',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.grey,
                      fontSize: 18),
                )
              : Text(
                  'Categoria *',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      fontSize: 14),
                ),
          subtitle: createStores.category == null
              ? null
              : Text(
                  '${createStores.category.description}',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: () async {
            final category = await showDialog(
                context: context,
                builder: (_) => CategoryScreens(
                      showAll: false,
                      selected: createStores.category,
                    ));
            if (category != null) {
              createStores.setCategory(category);
            }
          });
    });
  }
}
