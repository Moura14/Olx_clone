import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/ad.dart';
import 'package:olx_mobx/models/adress.dart';
import 'package:olx_mobx/models/category.dart';
import 'package:olx_mobx/repositories/add_repository.dart';
import 'package:olx_mobx/stores/cep_stores.dart';
import 'package:olx_mobx/stores/user_menage_stores.dart';
import 'package:olx_mobx/helpers/extensions.dart';
part 'create_stores.g.dart';

class CreateStores = _CreateStoresBase with _$CreateStores;

abstract class _CreateStoresBase with Store {
  _CreateStoresBase(this.ad) {
    title = ad.title ?? '';
    description = ad.description ?? '';
    images = ad.images.asObservable();
    category = ad.category;
    priceText = ad.price?.toStringAsFixed(2) ?? '';
    hidePhone = ad.hidePhone;

    if (ad.adress != null) {
      cepStore = CepStore(ad.adress.cep);
    } else {
      cepStore = CepStore(null);
    }
  }

  final Ad ad;
  ObservableList images = ObservableList();

  @computed
  bool get ImagesValid => images.isNotEmpty;
  String get imagesError {
    if (!showErrors || ImagesValid)
      return null;
    else
      return 'Insira imagens';
  }

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 6;
  String get titleError {
    if (!showErrors || titleValid)
      return null;
    else if (title.isEmpty)
      return "Campo obrigátorio";
    else
      return "Título muito curto";
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get categoryValid => category != null;
  String get categoryError {
    if (!showErrors || categoryValid)
      return null;
    else
      return 'Campo obrigatório';
  }

  CepStore cepStore;

  @computed
  Adress get adress => cepStore.adress;
  bool get adressValid => adress != null;
  String get addressError {
    if (!showErrors || adressValid)
      return null;
    else
      return 'Campo obrigatório';
  }

  @observable
  String priceText = '';

  @action
  void setPrice(String value) => priceText = value;

  @computed
  num get price {
    if (priceText.contains(',')) {
      return num.tryParse(priceText.replaceAll(RegExp('[^0-9]'), '')) / 100;
    } else {
      return num.tryParse(priceText);
    }
  }

  bool get priceValid => price != null && price <= 9999999;
  String get priceError {
    if (!showErrors || priceValid)
      return null;
    else if (priceText.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Preço inválido';
  }

  @computed
  bool get descriptionValid => description.length >= 10;
  String get descriptionError {
    if (!showErrors || descriptionValid)
      return null;
    else if (description.isEmpty)
      return "Campo Obrigatório";
    else
      return "Descrição muito curta";
  }

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  bool hidePhone = false;

  @action
  void setHidePhone(bool value) => hidePhone = value;

  @computed
  bool get formValid =>
      ImagesValid &&
      titleValid &&
      descriptionValid &&
      categoryValid &&
      adressValid &&
      priceValid;

  @computed
  Function get sendPressed => formValid ? _send : null;
  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @observable
  bool loading = false;

  @observable
  String error;

  @observable
  bool savedAd = false;

  @action
  Future<void> _send() async {
    ad.title = title;
    ad.description = description;
    ad.hidePhone = hidePhone;
    ad.category = category;
    ad.price = price;
    ad.images = images;
    ad.adress = adress;
    ad.user = GetIt.I<UserMenageStore>().user;

    loading = true;
    try {
      await AdRepository().save(ad);
      savedAd = true;
    } catch (e) {
      error = e;
    }
    loading = false;
  }
}
