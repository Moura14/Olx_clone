import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/screens/filter/components/sectin_title.dart';
import 'package:olx_mobx/stores/filter_stores.dart';

class VendorTypeField extends StatelessWidget {
  //const VendorTypeField({Key key}) : super(key: key);

  VendorTypeField(this.filterStores);
  final FilterStores filterStores;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("Tipo de anunciante"),
        Observer(builder: (_) {
          return Wrap(
            runSpacing: 4,
            children: [
              GestureDetector(
                onTap: () {
                  if (filterStores.isTypeParticular) {
                    if (filterStores.isTypeProfissional)
                      filterStores.resetVendorType(VENDOR_TYPE_PARTICULAR);
                    else
                      filterStores.selectVendorType(VENDOR_TYPE_PROFISSIONAL);
                  } else {
                    filterStores.setVendorType(VENDOR_TYPE_PARTICULAR);
                  }
                },
                child: Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: filterStores.isTypeParticular
                            ? Colors.purple
                            : Colors.transparent,
                        border: Border.all(
                            color: filterStores.isTypeParticular
                                ? Colors.purple
                                : Colors.grey)),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    alignment: Alignment.center,
                    child: Text("Particular",
                        style: TextStyle(
                            color: filterStores.isTypeParticular
                                ? Colors.white
                                : Colors.black))),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  if (filterStores.isTypeProfissional) {
                    if (filterStores.isTypeParticular)
                      filterStores.resetVendorType(VENDOR_TYPE_PROFISSIONAL);
                    else
                      filterStores.selectVendorType(VENDOR_TYPE_PARTICULAR);
                  } else {
                    filterStores.setVendorType(VENDOR_TYPE_PROFISSIONAL);
                  }
                },
                child: Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: filterStores.isTypeProfissional
                          ? Colors.purple
                          : Colors.transparent,
                      border: Border.all(
                          color: filterStores.isTypeProfissional
                              ? Colors.purple
                              : Colors.grey)),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.center,
                  child: Text(
                    "Profissional",
                    style: TextStyle(
                        color: filterStores.isTypeProfissional
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              )
            ],
          );
        })
      ],
    );
  }
}
