import 'package:flutter/material.dart';
import 'package:olx_mobx/screens/home/components/bar_buttons.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BarButton(
          label: "Categorias",
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[400]))),
        ),
        BarButton(
          label: "Filtros",
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[400]),
                  left: BorderSide(color: Colors.grey[400]))),
        )
      ],
    );
  }
}
