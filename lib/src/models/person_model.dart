abstract class PersonModel {
  int? _id;
  String? _name;
  String? _email;
  String? _phone;

  PersonModel(
      {required int id,required String name, required String email, required String phone}) {
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
  }

  getName() {
    return _name;
  }

  getEmail() {
    return _email;
  }

  getPhone() {
    return _phone;
  }

  getId() {
    return _id;
  }
  
  setId(int newId){
    _id = newId;
  }

  setName(String name) {
    _name = name;
  }

  setEmail(String email) {
    _email = email;
  }

  setPhone(String phone) {
    _phone = phone;
  }
}
