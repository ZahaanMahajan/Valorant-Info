import 'package:cached_network_image/cached_network_image.dart';
import 'package:valorant/models/weapon/weapon.dart';
import 'package:flutter/material.dart';

class WeaponsSkinScreen extends StatefulWidget {
  const WeaponsSkinScreen({
    super.key,
    required this.weapon,
  });

  final Weapon weapon;

  @override
  State<WeaponsSkinScreen> createState() => _WeaponsSkinScreenState();
}

class _WeaponsSkinScreenState extends State<WeaponsSkinScreen>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;
  late int idx = 0;

  OverlayEntry? entry;

  @override
  void initState() {
    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )
      ..addListener(
        () => controller.value = animation!.value,
      )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          removeOverlay();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  isDarkMode
                      ? const Color(0xFF343434)
                      : const Color(0xCCD4CDCD),
                  isDarkMode
                      ? const Color(0xFF565353)
                      : const Color(0xFFFFFFFF),
                ],
                stops: const [0.4, 0.6],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Hero(
              tag: widget.weapon.uuid!,
              child: buildImage(),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: widget.weapon.skins!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          idx = index;
                        });
                      },
                      child: Container(
                        width: 100,
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color:
                                        isDarkMode ? Colors.white : Colors.grey,
                                    width: 2),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    isDarkMode
                                        ? const Color(0xFF343434)
                                        : const Color(0xCCD4CDCD),
                                    isDarkMode
                                        ? const Color(0xFF565353)
                                        : const Color(0xFFFFFFFF),
                                  ],
                                  stops: const [0.3, 0.7],
                                ),
                              ),
                              child: Image(
                                image: NetworkImage(
                                  imageUrl(index),
                                ),
                                height: 90,
                                width: 100,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.weapon.skins![index].displayName!,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    isDarkMode ? Colors.white : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Builder buildImage() {
    return Builder(
      builder: (context) => InteractiveViewer(
        clipBehavior: Clip.none,
        transformationController: controller,
        maxScale: 4,
        onInteractionStart: (details) {
          if (details.pointerCount < 2) return;
          showOverlay(context);
        },
        onInteractionEnd: (details) => resetAnimation(),
        child: CachedNetworkImage(
          height: 200,
          width: double.infinity,
          key: UniqueKey(),
          imageUrl: imageUrl(idx),
        ),
      ),
    );
  }

  void showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy,
          width: MediaQuery.of(context).size.width,
          child: buildImage(),
        );
      },
    );
    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }

  String imageUrl(int index) {
    if (widget.weapon.skins![index].chromas![0].displayIcon == null) {
      return widget.weapon.skins![index].chromas![0].fullRender.toString();
    } else if (widget.weapon.skins![index].displayIcon == null) {
      return widget.weapon.skins![index].chromas![0].displayIcon.toString();
    } else if (widget.weapon.skins![index].contentTierUuid == null) {
      return widget.weapon.displayIcon!;
    } else if (widget.weapon.skins![index].chromas![0].displayIcon == null) {}
    return widget.weapon.skins![index].chromas![0].fullRender.toString();
  }

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
      ),
    );
    animationController.forward(from: 0);
  }
}
