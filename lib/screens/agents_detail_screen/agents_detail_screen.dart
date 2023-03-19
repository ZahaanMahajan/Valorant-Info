import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/agent/agent.dart';

class AgentDetailScreen extends StatefulWidget {
  const AgentDetailScreen({
    super.key,
    required this.agent,
  });

  final Agent agent;

  @override
  State<AgentDetailScreen> createState() => _AgentDetailScreenState();
}

class _AgentDetailScreenState extends State<AgentDetailScreen> {
  late int idx = 0;
  @override
  Widget build(BuildContext context) {
    // final brightness = MediaQuery.of(context).platformBrightness;
    // bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021728),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Color(0xFF021728),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            const Text(
                              "Agent",
                              style: TextStyle(
                                fontFamily: "Valorant",
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              widget.agent.displayName!,
                              style: const TextStyle(
                                fontFamily: "Valorant",
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.network(
                              widget.agent.role!.displayIcon!,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.agent.role!.displayName!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 50,
                  child: SizedBox(
                    height: 375,
                    child: CachedNetworkImage(
                      key: UniqueKey(),
                      imageUrl: widget.agent.background!,
                      color: Colors.red,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      SizedBox(
                        height: 300,
                        child: Hero(
                          tag: widget.agent.uuid!,
                          child: CachedNetworkImage(
                            key: UniqueKey(),
                            imageUrl: widget.agent.fullPortrait!,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.grey),
                      Text(
                        "About",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.agent.description!,
                        style: GoogleFonts.sourceCodePro(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Abilities",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: 150,
                        child: ListView.builder(
                          itemCount: widget.agent.abilities!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Container(
                                height: 72,
                                width: 72,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF021728),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: idx == index
                                        ? Colors.white
                                        : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      idx = index;
                                    });
                                  },
                                  child: widget.agent.abilities![index]
                                              .displayIcon !=
                                          null
                                      ? Image.network(widget
                                          .agent.abilities![index].displayIcon!)
                                      : const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 45,
                                width: 100,
                                child: Text(
                                  widget.agent.abilities![index].displayName!,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: "Valorant",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: const Color(0xFF021728),
                            borderRadius: BorderRadius.circular(20)),
                        child: SingleChildScrollView(
                          child: Text(
                            widget.agent.abilities![idx].description!,
                            style: GoogleFonts.sourceCodePro(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
