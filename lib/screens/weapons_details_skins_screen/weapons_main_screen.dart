import 'package:flutter/material.dart';
import 'package:valorant/screens/weapons_details_skins_screen/weapons_details_screen.dart';
import 'package:valorant/screens/weapons_details_skins_screen/weapons_skins_screen.dart';
import '../../models/weapon/weapon.dart';
import '../../widgets/animated_toggle.dart';

class WeaponsMainScreen extends StatefulWidget {
  const WeaponsMainScreen({
    Key? key,
    required this.weapon,
  }) : super(key: key);

  final Weapon weapon;

  @override
  State<WeaponsMainScreen> createState() => _WeaponsMainScreenState();
}

class _WeaponsMainScreenState extends State<WeaponsMainScreen> {
  int toggleValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.weapon.displayName!,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedToggle(
            values: const ["Skins", "Details"],
            onToggleCallback: (value) {
              setState(() {
                toggleValue = value;
              });
            },
            buttonColor: const Color(0xFF979BA1),
            backgroundColor: const Color(0xFFFFFFFF),
            textColor: const Color(0xFFFFFFFF),
          ),
          toggleValue == 0
              ? WeaponsSkinScreen(weapon: widget.weapon)
              : WeaponsDetailScreen(weapon: widget.weapon),
        ],
      ),
    );
  }
}
