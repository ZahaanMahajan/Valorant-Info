import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/map_model/map_model.dart';

class MapApi {
  static Future<List<Maps>> fetchMaps() async {
    const url = 'https://valorant-api.com/v1/maps';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['data'] as List<dynamic>;
    final maps = results.map((emap) {
      return Maps.fromJson(emap);
    }).toList();
    return maps;
  }
}
