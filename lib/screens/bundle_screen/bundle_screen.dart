import 'package:cached_network_image/cached_network_image.dart';
import 'package:valorant/services/bundle_api.dart';
import '../../models/bundle/bundle.dart';
import 'package:flutter/material.dart';

class BundleScreen extends StatefulWidget {
  const BundleScreen({
    super.key,
  });

  @override
  State<BundleScreen> createState() => _BundleScreenState();
}

class _BundleScreenState extends State<BundleScreen> {
  List<Bundle>? bundles = [];

  @override
  void initState() {
    fetchBundles();
    super.initState();
  }

  Future<void> fetchBundles() async {
    final response = await BundleApi.fetchBundles();
    setState(() {
      bundles = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bundles"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: bundles!.length,
        itemBuilder: (context, index) {
          final bundle = bundles![index];
          return GestureDetector(
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BundleDetailsScreen(
            //       bundle: bundle,
            //     ),
            //   ),
            // ),
            child: Stack(
              children: [
                Hero(
                  tag: bundle.uuid!,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        key: UniqueKey(),
                        imageUrl: bundle.displayIcon!,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    top: 24,
                  ),
                  child: Text(
                    bundle.displayName!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Valorant",
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
