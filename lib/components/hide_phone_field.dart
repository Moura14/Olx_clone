import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/stores/create_stores.dart';

class HidePhoneField extends StatelessWidget {
  //const HidePhoneField({Key key}) : super(key: key);

  HidePhoneField(this.createStore);

  final CreateStores createStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(builder: (_) {
            return Checkbox(
              value: createStore.hidePhone,
              onChanged: createStore.setHidePhone,
              activeColor: Colors.purple,
            );
          }),
          Expanded(child: Text("Ocultar o meu telefone neste anúncio"))
        ],
      ),
    );
  }
}
