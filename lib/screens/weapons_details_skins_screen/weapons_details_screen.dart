import 'package:flutter/material.dart';
import '../../models/weapon/weapon.dart';

class WeaponsDetailScreen extends StatefulWidget {
  const WeaponsDetailScreen({
    Key? key,
    required this.weapon,
  }) : super(key: key);

  final Weapon weapon;

  @override
  State<WeaponsDetailScreen> createState() => _WeaponsDetailScreenState();
}

class _WeaponsDetailScreenState extends State<WeaponsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    List weaponStatsKey = [
      "Magzine Size",
      "Category",
      "Creds",
      "Equip Time",
      "Reload Time",
      "Wall Penetration",
      "Fire Rate",
      "First Bullet Accuracy",
      "Alt Fire Type",
      "Zoom Status",
    ];

    String? wallPen = widget.weapon.weaponStats?.wallPenetration.toString();
    String? altFire = widget.weapon.weaponStats?.altFireType.toString() != null
        ? widget.weapon.weaponStats?.altFireType
        : null;

    List weaponStatsValue = [
      widget.weapon.weaponStats?.magazineSize,
      widget.weapon.shopData?.category,
      widget.weapon.shopData?.cost.toString(),
      "${widget.weapon.weaponStats?.equipTimeSeconds} sec",
      "${widget.weapon.weaponStats?.reloadTimeSeconds} sec",
      wallPen?.substring(wallPen.indexOf("::") + 2, wallPen.length),
      "${widget.weapon.weaponStats?.fireRate} round/sec",
      widget.weapon.weaponStats?.firstBulletAccuracy.toString(),
      altFire?.substring(altFire.indexOf("::") + 2, altFire.length),
      widget.weapon.weaponStats?.adsStats?.zoomMultiplier,
    ];

    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Weapon Stats",
              style: TextStyle(
                fontFamily: "Valorant",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.grey.shade200 : Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                weaponStatsKey[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              weaponStatsValue[index].toString(),
                              style: TextStyle(
                                color: isDarkMode
                                    ? Colors.grey.shade200
                                    : Colors.grey.shade700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
