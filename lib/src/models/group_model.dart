class GroupModel {
  int? _id;
  String? _name;
  String? _description;

  GroupModel({required id, required name, required description}) {
    _id = id;
    _name = name;
    _description = description;
  }

  getId() {
    return _id;
  }

  getName() {
    return _name;
  }

  setName(String newName) {
    _name = newName;
  }

  getDescription() {
    return _description;
  }

  setDescription(String description) {
    _description = description;
  }
}
