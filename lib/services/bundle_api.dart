import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/bundle/bundle.dart';

class BundleApi {
  static Future<List<Bundle>> fetchBundles() async {
    const url = 'https://valorant-api.com/v1/bundles';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['data'] as List<dynamic>;
    final bundles = results.map((bundle) {
      return Bundle.fromJson(bundle);
    }).toList();
    return bundles;
  }
}
