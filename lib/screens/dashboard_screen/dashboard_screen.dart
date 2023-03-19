import 'package:flutter/material.dart';
import 'package:valorant/constants.dart';
import 'package:valorant/screens/agents_screen/agents_screen.dart';
import '../bundle_screen/bundle_screen.dart';
import '../maps_screen/maps_screen.dart';
import '../weapons_screen/weapons_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool animate = false;
  @override
  void initState() {
    setState(() => animate = false);
    _startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    List dashBoard = [
      [
        "Agents",
        "assets/valorant-agents.jpg",
        const AgentScreen(),
      ],
      [
        "Maps",
        "assets/valorant-maps.jpg",
        const MapsScreen(),
      ],
      [
        "Weapons",
        "assets/valorant-weapons.jpg",
        const WeaponsScreen(),
      ],
      [
        "Bundles",
        "assets/valorant-bundles.jpg",
        const BundleScreen(),
      ],
    ];
    return AnimatedOpacity(
      opacity: animate ? 1 : 0,
      duration: const Duration(milliseconds: 3000),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "DashBoard",
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: dashBoard.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: ToPageTile(
                  toPageText: dashBoard[index][0],
                  imagePath: dashBoard[index][1],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => dashBoard[index][2],
                    ),
                  ),
                  color: isDarkMode ? kPrimaryColor : kSecondaryColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() => animate = true);
  }
}

class ToPageTile extends StatelessWidget {
  const ToPageTile({
    super.key,
    required this.toPageText,
    this.onTap,
    required this.imagePath,
    required this.color,
  });

  final String toPageText, imagePath;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // final brightness = MediaQuery.of(context).platformBrightness;
    // bool isDarkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Image.asset(
                height: 180,
                width: double.infinity,
                imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Text(
              toPageText,
              style: const TextStyle(
                fontFamily: "Valorant",
                fontSize: 28,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
