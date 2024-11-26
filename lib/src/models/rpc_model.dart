class RpcModel {
  String? _code;
  double? _width;
  double? _height;

  RpcModel();

  getCode() {
    return _code;
  }

  getWidth() {
    return _width;
  }

  getHeight() {
    return _height;
  }

  setCode(String newCode) {
    _code = newCode;
  }

  setWidth(double newWidth) {
    _width = newWidth;
  }

  setHeight(double newHeight) {
    _height = newHeight;
  }
}
