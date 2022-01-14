import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/screens/filter/components/order_by_field.dart';
import 'package:olx_mobx/screens/filter/price_range_field.dart';
import 'package:olx_mobx/screens/home/components/vendor_type_field.dart';
import 'package:olx_mobx/stores/filter_stores.dart';
import 'package:olx_mobx/stores/home_stores.dart';

class FilterScreen extends StatelessWidget {
  //const FilterScreen({Key key}) : super(key: key);

  final FilterStores filterStores = GetIt.I<HomeStore>().clonedField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtrar Busca"),
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OrderByField(filterStores),
                  PriceRangeField(filterStores),
                  VendorTypeField(filterStores),
                  Observer(builder: (_) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      height: 50,
                      child: RaisedButton(
                        disabledColor: Colors.orange.withAlpha(120),
                        color: Colors.orange,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          "FILTRAR",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        onPressed: filterStores.isFormValid
                            ? () {
                                filterStores.save();
                                Navigator.of(context).pop();
                              }
                            : null,
                      ),
                    );
                  })
                ],
              ),
            )),
      )),
    );
  }
}
