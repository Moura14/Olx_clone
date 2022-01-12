import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/screens/filter/components/sectin_title.dart';
import 'package:olx_mobx/stores/filter_stores.dart';

class OrderByField extends StatelessWidget {
  //const OrderByField({Key key}) : super(key: key);

  OrderByField(this.filter);
  final FilterStores filter;

  @override
  Widget build(BuildContext context) {
    Widget buildOptions(String title, OrderBy options) {
      return GestureDetector(
        onTap: () {
          filter.setOrderBy(options);
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: filter.orderBy == options
                  ? Colors.purple
                  : Colors.transparent,
              border: Border.all(
                  color:
                      filter.orderBy == options ? Colors.purple : Colors.grey)),
          child: Text(
            title,
            style: TextStyle(
                color: filter.orderBy == options ? Colors.white : Colors.black),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("Ordenar por"),
        Observer(builder: (_) {
          return Row(
            children: [
              buildOptions('Data', OrderBy.DATE),
              const SizedBox(
                width: 12,
              ),
              buildOptions("Preço", OrderBy.PRICE)
            ],
          );
        })
      ],
    );
  }
}
