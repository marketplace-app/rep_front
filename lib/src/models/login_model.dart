class LoginModel {
  //Atributos principais
  double? _widthPage;
  double? _heightPage;
  String? _user = '';
  String? _password = '';

  LoginModel();
  //widthPage

  LoginModel.fromJson(Map<String, dynamic> json) {
    _user = json['userName'];
    _password = json['passWord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = _user;
    data['passWord'] = _password;
    return data;
  }

  getWidth() {
    return _widthPage;
  }

  getHeight() {
    return _heightPage;
  }

  getUser() {
    return _user;
  }

  getPassword() {
    return _password;
  }

  setUser(String newPassword) {
    _user = newPassword;
  }

  setPassword(String newPassword) {
    _password = newPassword;
  }

  setWidth(double newWidthPage) {
    _widthPage = newWidthPage;
  }

  setHeight(double newHeightPage) {
    _heightPage = newHeightPage;
  }
}
