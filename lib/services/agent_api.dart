import '../models/agent/agent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgentApi {
  static Future<List<Agent>> fetchAgents() async {
    const url = 'https://valorant-api.com/v1/agents';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['data'] as List<dynamic>;
    final agents = results.map((agent) {
      return Agent.fromJson(agent);
    }).toList();
    return agents;
  }
}
