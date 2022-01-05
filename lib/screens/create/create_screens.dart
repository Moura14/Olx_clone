import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/components/drawer/custom_drawer.dart';
import 'package:olx_mobx/components/hide_phone_field.dart';
import 'package:olx_mobx/screens/create/components/category_field.dart';
import 'package:olx_mobx/screens/create/components/cep_field.dart';
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
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImagesField(createStores),
                  Observer(builder: (_) {
                    return TextFormField(
                        onChanged: createStores.setTitle,
                        decoration: InputDecoration(
                            labelText: "Título *",
                            labelStyle: labelStyle,
                            contentPadding: contentPadding,
                            errorText: createStores.titleError));
                  }),
                  Observer(builder: (_) {
                    return TextFormField(
                      onChanged: createStores.setDescription,
                      decoration: InputDecoration(
                          labelText: "Descrição *",
                          labelStyle: labelStyle,
                          contentPadding: contentPadding,
                          errorText: createStores.descriptionError),
                      maxLines: null,
                    );
                  }),
                  CategoryField(createStores),
                  CepField(createStores),
                  Observer(builder: (_) {
                    return TextFormField(
                      onChanged: createStores.setPrice,
                      decoration: InputDecoration(
                          labelText: "Preço *",
                          labelStyle: labelStyle,
                          contentPadding: contentPadding,
                          prefixText: "R\$",
                          errorText: createStores.priceError),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        RealInputFormatter()
                      ],
                    );
                  }),
                  HidePhoneField(createStores),
                  Observer(builder: (_) {
                    return SizedBox(
                        height: 50,
                        child: GestureDetector(
                          onTap: createStores.invalidSendPressed,
                          child: RaisedButton(
                            child: Text(
                              "Enviar",
                              style: TextStyle(fontSize: 18),
                            ),
                            textColor: Colors.white,
                            color: Colors.orange,
                            disabledColor: Colors.orange.withAlpha(120),
                            onPressed: createStores.sendPressed,
                          ),
                        ));
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
