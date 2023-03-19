import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant/models/map_model/map_model.dart';
import 'package:valorant/screens/maps_detail_screen/maps_detail_screen.dart';
import 'package:valorant/services/map_api.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  List<Maps>? maps = [];

  @override
  void initState() {
    fetchMaps();
    super.initState();
  }

  Future<void> fetchMaps() async {
    final response = await MapApi.fetchMaps();
    setState(() {
      maps = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Maps",
        ),
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
              maps!.length,
              (index) {
                final map = maps![index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapsDetailScreen(map: map),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Hero(
                            tag: map.uuid!,
                            child: CachedNetworkImage(
                              key: UniqueKey(),
                              imageUrl: map.splash!,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              map.displayName!,
                              style: const TextStyle(
                                fontFamily: "Valorant",
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              map.coordinates!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
