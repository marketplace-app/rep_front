class RegionModel {
  int? _id;
  String? _region;

  RegionModel({required int id, required String region}) {
    _id = id;
    _region = region;
  }

  getId() {
    return _id;
  }

  getRegion() {
    return _region;
  }

  setRegion(String newRegion) {
    _region = newRegion;
  }
}
