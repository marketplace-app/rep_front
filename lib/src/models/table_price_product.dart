class TableHeaderPriceModel {
  int? _code;
  String? _descriptionTablePrice;
  bool? _status;

  TableHeaderPriceModel(
      {required int code,
      required String descriptionTablePrice,
      required bool status}) {
    _code = code;
    _descriptionTablePrice = descriptionTablePrice;
    _status = status;
  }

  getCode() {
    return _code;
  }

  getDescriptionTablePrice() {
    return _descriptionTablePrice;
  }

  getStatus() {
    return _status;
  }

  setDescritionTablePrice(String newDescriptionTablePrice) {
    _descriptionTablePrice = newDescriptionTablePrice;
  }

  setStatus(bool newStatus) {
    _status = newStatus;
  }
}
