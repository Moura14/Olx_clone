import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/category.dart';
part 'create_stores.g.dart';

class CreateStores = _CreateStoresBase with _$CreateStores;

abstract class _CreateStoresBase with Store {
  ObservableList images = ObservableList();

  @computed
  bool get ImagesValid => images.isNotEmpty;
  String get imagesError {
    if (ImagesValid)
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
    if (titleValid)
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
  bool get descriptionValid => description.length >= 10;
  String get descriptionError {
    if (descriptionValid)
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
}
