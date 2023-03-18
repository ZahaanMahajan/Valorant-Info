import 'package:valorant/models/agent/ability.dart';
import 'package:valorant/models/agent/agent.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  List<Agent> agents = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Valorant"),
      ),
      body: ListView.builder(
        itemCount: agents.length,
        itemBuilder: (context, index) {
          final agent = agents[index];
          final name = agent.displayName;
          final description = agent.description;
          final icon = agent.displayIconSmall;
          // final role = agent.role;
          // final roleName = role?.displayName;
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: ListTile(
              title: Text(
                name.toString(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(description.toString()),
              leading: Image(image: NetworkImage(icon.toString())),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchAgents,
      ),
    );
  }

  Future<void> fetchAgents() async {
    const url = 'https://valorant-api.com/v1/agents';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['data'] as List<dynamic>;

    final transformed = results.map((agent) {
      return Agent(
        displayName: agent['displayName'],
        description: agent['description'],
        displayIconSmall: agent['displayIconSmall'],
        // role: agent['role']['displayName'],
      );
    }).toList();
    setState(() {
      agents = transformed;
    });
  }
}
