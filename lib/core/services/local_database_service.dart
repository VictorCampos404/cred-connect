import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabaseService {
  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  Future<void> save(String collection, Map<String, dynamic> json) async {
    final prefs = await _prefs;

    json.addAll({'id': _generateUniqueId()});

    final List<Map<String, dynamic>> existing = await getAll(collection);
    final exists = existing.any((item) => item['id'] == json['id']);

    if (exists) {
      throw Exception(
        'Item with id \${json[\'id\']} already exists in \$collection',
      );
    }

    existing.add(json);
    await prefs.setString(collection, jsonEncode(existing));
  }

  Future<List<Map<String, dynamic>>> getAll(String collection) async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(collection);
    if (jsonString == null) return [];

    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded.cast<Map<String, dynamic>>();
  }

  Future<void> update(String collection, Map<String, dynamic> json) async {
    final prefs = await _prefs;

    if (!json.containsKey('id') || json['id'] is! String) {
      throw Exception('JSON must contain a unique string "id" key');
    }

    final List<Map<String, dynamic>> existing = await getAll(collection);
    final index = existing.indexWhere((item) => item['id'] == json['id']);

    if (index == -1) {
      throw Exception(
        'Item with id \${json[\'id\']} not found in \$collection',
      );
    }

    existing[index] = json;
    await prefs.setString(collection, jsonEncode(existing));
  }

  Future<void> delete(String collection, String id) async {
    final prefs = await _prefs;

    final List<Map<String, dynamic>> existing = await getAll(collection);
    existing.removeWhere((item) => item['id'] == id);

    await prefs.setString(collection, jsonEncode(existing));
  }

  Future<void> clear(String collection) async {
    final prefs = await _prefs;
    await prefs.remove(collection);
  }

  String _generateUniqueId() {
    final now = DateTime.now().toUtc();
    return now.microsecondsSinceEpoch.toString();
  }
}
