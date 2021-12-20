import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/adress.dart';
import 'package:olx_mobx/repositories/cep_repository.dart';
part 'cep_stores.g.dart';

class CepStore = _CepStoreBase with _$CepStore;

abstract class _CepStoreBase with Store {
  _CepStoreBase() {
    autorun((_) {
      if (clearCep.length != 8) {
        _reset();
      } else {
        _searchCep();
      }
    });
  }
  @observable
  String cep = '';

  @action
  void setCep(String value) => cep = value;

  @computed
  String get clearCep => cep.replaceAll(RegExp('[^0-9]'), '');

  @observable
  Adress adress;

  @observable
  String error;

  @observable
  bool loading = false;

  @action
  Future<void> _searchCep() async {
    loading = true;
    try {
      adress = await CepRepository().getAdressFromApi(clearCep);
      error = null;
    } catch (e) {
      error = e;
      adress = null;
    }
    loading = false;
  }

  @action
  void _reset() {
    adress = null;
    error = null;
  }
}
