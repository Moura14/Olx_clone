import 'package:mobx/mobx.dart';
part 'filter_stores.g.dart';

enum OrderBy { DATE, PRICE }

class FilterStores = _FilterStoresBase with _$FilterStores;

abstract class _FilterStoresBase with Store {
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
}
