import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant/screens/agents_detail_screen/agents_detail_screen.dart';
import 'package:valorant/services/agent_api.dart';
import '../../models/agent/agent.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({super.key});

  @override
  State<AgentScreen> createState() => AgentScreenState();
}

class AgentScreenState extends State<AgentScreen> {
  List<Agent>? agents = [];

  @override
  void initState() {
    fetchAgents();
    super.initState();
  }

  Future<void> fetchAgents() async {
    final response = await AgentApi.fetchAgents();
    setState(() {
      agents = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agents"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              agents!.length,
              (index) {
                final agent = agents![index];
                return agent.isPlayableCharacter as bool
                    ? AgentTile(
                        agent: agent,
                      )
                    : const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AgentTile extends StatelessWidget {
  const AgentTile({
    super.key,
    required this.agent,
  });

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AgentDetailScreen(
            agent: agent,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        padding: const EdgeInsets.all(5),
        height: 160,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isDarkMode ? Colors.grey.shade800 : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 1,
                      color: isDarkMode ? Colors.black45 : Colors.grey.shade300,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        agent.displayName!,
                        style: const TextStyle(
                          fontFamily: "Valorant",
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        agent.role!.displayName!,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Hero(
                        tag: agent.uuid!,
                        child: CachedNetworkImage(
                          key: UniqueKey(),
                          imageUrl: agent.fullPortrait!,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 12),
                      child: Image.network(
                        agent.role!.displayIcon!,
                        color: Colors.black,
                        height: 30,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
