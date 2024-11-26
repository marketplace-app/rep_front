class ProductModel {
  String? _nameProduct;
  String? _imageProduct;
  String? _codeProduct;
  int? _stockProduct;
  double? _priceProduct;

  ProductModel(String nameProduct, String imageProduct, String codeProduct,
      int stockProduct, double price) {
    _nameProduct = nameProduct;
    _imageProduct = imageProduct;
    _codeProduct = codeProduct;
    _stockProduct = stockProduct;
    _priceProduct = price;
  }

  getNameProduct() {
    return _nameProduct;
  }

  setNameProduct(String nameProduct) {
    _nameProduct = nameProduct;
  }

  getImageProduct() {
    return _imageProduct;
  }

  setImageProduct(String imageProduct) {
    _imageProduct = imageProduct;
  }

  getCodeProduct() {
    return _codeProduct;
  }

  setCodeProduct(String codeProduct) {
    _codeProduct = codeProduct;
  }

  getStockProduct() {
    return _stockProduct;
  }

  getPriceProduct() {
    return _priceProduct;
  }

  setPriceProduct(double priceProduct) {
    _priceProduct = priceProduct;
  }
}
