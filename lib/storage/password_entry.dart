import 'package:passwords_manager/utility/Categories.dart';

class PasswordEntry {
  String _title;
  Map<String, String> _data;
  Categories _category;

  PasswordEntry(String title, Map<String, String> data, Categories category) {
    this._title = title;
    this._data = data;
    this._category = category;
  }

  PasswordEntry getEntryFromJson(String json) {
    return new PasswordEntry(json, null, Categories.all);
  }

  bool hasDisplayableRow(PasswordEntry entry) {
    Iterable<String> keys = entry._data.keys;
    return keys.isNotEmpty ||
        keys.contains('username') ||
        keys.contains('mail');
  }

  Map<String, String> getDisplayableRows(PasswordEntry entry) {
    Map<String, String> results;
    if (entry._data.containsKey('username')) {
      results['username'] = entry._data['username'];
    }
    if (entry._data.containsKey('mail')) {
      results['mail'] = entry._data['mail'];
    }
  }
}
