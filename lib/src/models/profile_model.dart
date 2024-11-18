// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'group_model.dart';

class ProfileModel {
  int? _id;
  String? _name;
  GroupModel? _groupModel;
  String? _description;

  ProfileModel(
      {required int id,
      required String name,
      required GroupModel groupModel,
      required String description}) {
    _id = id;
    _name = name;
    _groupModel = groupModel;
    _description = description;
  }

  getId() {
    return _id;
  }

  getName() {
    return _name;
  }

  getGroupModel() {
    return _groupModel;
  }

  getDescription() {
    return _description;
  }

  setName(String newName) {
    _name = newName;
  }

  setGroupModel(GroupModel newGroupModel) {
    _groupModel = newGroupModel;
  }

  setDescription(String newDescription) {
    _description = newDescription;
  }
}
