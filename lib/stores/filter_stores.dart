import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_mobx/stores/home_stores.dart';
part 'filter_stores.g.dart';

enum OrderBy { DATE, PRICE }

const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFISSIONAL = 1 << 1;

class FilterStores = _FilterStoresBase with _$FilterStores;

abstract class _FilterStoresBase with Store {
  _FilterStoresBase(
      {this.orderBy,
      this.minPrice,
      this.maxPrice,
      this.vendorType = VENDOR_TYPE_PROFISSIONAL});
  @observable
  OrderBy orderBy = OrderBy.DATE;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;

  @observable
  int minPrice;

  @action
  void setMinPrice(int value) => minPrice = value;

  @observable
  int maxPrice;

  void setMaxPrice(int value) => maxPrice = value;

  @computed
  String get priceError =>
      maxPrice != null && minPrice != null && maxPrice < minPrice
          ? 'Faixa de preço inválida'
          : null;

  @observable
  int vendorType;

  @action
  void selectVendorType(int value) => vendorType = value;
  void setVendorType(int type) => vendorType = vendorType | type;
  void resetVendorType(int type) => vendorType = vendorType & ~type;

  @computed
  bool get isTypeParticular => (vendorType & VENDOR_TYPE_PARTICULAR) != 0;
  bool get isTypeProfissional => (vendorType & VENDOR_TYPE_PROFISSIONAL) != 0;

  @computed
  bool get isFormValid => priceError == null;

  void save() {
    GetIt.I<HomeStore>().setFilter(this);
  }

  FilterStores clone() {
    return FilterStores(
        orderBy: orderBy,
        minPrice: minPrice,
        maxPrice: maxPrice,
        vendorType: vendorType);
  }
}
