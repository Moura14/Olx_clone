import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/screens/create/components/price_field.dart';
import 'package:olx_mobx/screens/filter/components/sectin_title.dart';
import 'package:olx_mobx/stores/filter_stores.dart';

class PriceRangeField extends StatelessWidget {
  //const PriceRangeField({Key key}) : super(key: key);

  final FilterStores filterStores;
  PriceRangeField(this.filterStores);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("Preço"),
        Row(
          children: [
            PriceField(
              label: "Min",
              onChanged: filterStores.setMinPrice,
              initialValue: filterStores.minPrice,
            ),
            const SizedBox(
              width: 12,
            ),
            PriceField(
                label: "Máx",
                onChanged: filterStores.setMaxPrice,
                initialValue: filterStores.maxPrice)
          ],
        ),
        Observer(builder: (_) {
          if (filterStores.priceError != null)
            return Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                filterStores.priceError,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            );
          return Container();
        })
      ],
    );
  }
}
