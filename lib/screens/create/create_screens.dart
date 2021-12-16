import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olx_mobx/components/drawer/custom_drawer.dart';
import 'package:olx_mobx/screens/create/components/images_field.dart';
import 'package:olx_mobx/stores/create_stores.dart';

class CreateScreens extends StatelessWidget {
  // const CreateScreens({Key key}) : super(key: key);

  final CreateStores createStores = CreateStores();

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
        fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18);

    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Criar Anúncio'),
        centerTitle: true,
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImagesField(createStores),
            TextFormField(
                decoration: InputDecoration(
                    labelText: "Título *",
                    labelStyle: labelStyle,
                    contentPadding: contentPadding)),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Descrição *",
                  labelStyle: labelStyle,
                  contentPadding: contentPadding),
              maxLines: null,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Preço *",
                  labelStyle: labelStyle,
                  contentPadding: contentPadding,
                  prefixText: "R\$"),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RealInputFormatter()
              ],
            )
          ],
        ),
      ),
    );
  }
}
