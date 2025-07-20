class RequiredPasswordFieldModel {
  late String _title;
  late bool _done;

  RequiredPasswordFieldModel({required String title, required bool validate}) {
    _title = title;
    _done = validate;
  }

  bool get validate => _done;

  set validate(bool value) {
    _done = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}
