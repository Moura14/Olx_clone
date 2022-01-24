import 'package:flutter/material.dart';
import 'package:olx_mobx/models/ad.dart';

class LocationPanel extends StatelessWidget {
  //const LocationPanel({Key key}) : super(key: key);

  LocationPanel(this.ad);
  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18, bottom: 12),
          child: Text("Localização",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CEP"),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Município"),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Bairro")
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Text(' ${ad.adress.cep}'),
                SizedBox(
                  height: 12,
                ),
                Text('${ad.adress.city.name}'),
                SizedBox(
                  height: 12,
                ),
                Text('${ad.adress.district}')
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ))
          ],
        )
      ],
    );
  }
}
