//import 'person_model.dart';
import 'profile_model.dart';
import 'region_model.dart';

class UserModel  {
  String? _login;
  String? _password;
  ProfileModel? _profileModel;
  RegionModel? _regionModel;

  // UserModel({
  //   required String newName,
  //   required String newEmail,
  //   required String newPhone,
  //   required String login,
  //   required String password,
  //   required ProfileModel profileModel,
  //   required RegionModel regionModel,
  // }) : super(name: newName, id: ,  email: newEmail, phone: newPhone) {
  //   _login = login;
  //   _password = password;
  //   _profileModel = profileModel;
  //   _regionModel = regionModel;
  // }

  // factory UserModel.fromJson(Map json) {
  //   return UserModel(
  //       newName: json['name'],
  //       newEmail: json['email'],
  //       newPhone: json['phone'],
  //       login: json['login'],
  //       password: json['password'],
  //       profileModel: json['profile'],
  //       regionModel: json['region']);
  // }

  // Map toJson(){
  //   return {
  //     'name': getName(),
  //     'email': getEmail(),
  //     'phone': getPhone(),
  //     'login': getLogin(),
  //     'password': getLogin(),
  //     'profileModel': getProfileModel(),
  //     'regionModel' : getRegionModel()
  //   };
  // }



  getLogin() {
    return _login;
  }

  getPassword() {
    return _password;
  }

  getProfileModel() {
    return _profileModel;
  }

  getRegionModel() {
    return _regionModel;
  }

  setLogin(String newLogin) {
    _login = newLogin;
  }

  setPassword(String newPassword) {
    _password = newPassword;
  }

  setProfileModel(ProfileModel newProfileModel) {
    _profileModel = newProfileModel;
  }

  setRegionModel(RegionModel newRegionModel) {
    _regionModel = newRegionModel;
  }
}
