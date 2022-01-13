import 'package:flutter/material.dart';
import 'package:olx_mobx/screens/filter/components/order_by_field.dart';
import 'package:olx_mobx/screens/filter/price_range_field.dart';
import 'package:olx_mobx/screens/home/components/vendor_type_field.dart';
import 'package:olx_mobx/stores/filter_stores.dart';

class FilterScreen extends StatelessWidget {
  //const FilterScreen({Key key}) : super(key: key);

  final FilterStores filterStores = FilterStores();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtrar Busca"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OrderByField(filterStores),
                  PriceRangeField(filterStores),
                  VendorTypeField(filterStores)
                ],
              ),
            )),
      ),
    );
  }
}
