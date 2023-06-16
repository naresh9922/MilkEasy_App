class ExtraData {
  static Map<String, dynamic> _extraData = {};

  static void setExtraData(Map<String, dynamic> data) {
    _extraData = data;
  }

  static Map<String, dynamic> getExtraData() {
    return _extraData;
  }
}
