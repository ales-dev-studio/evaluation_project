import 'package:evaluation_project/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return SizedBox(
      width: size,
      child: Image.asset(
        Assets.images.banner.path,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
