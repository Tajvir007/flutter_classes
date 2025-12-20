import 'package:flutter/material.dart';

import '../utils/asset_paths.dart';

class BackgroundPageLogo extends StatelessWidget {
  const BackgroundPageLogo({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(AssetPaths.pageLogo,
            width: 300,
            height: 300,
            opacity: const AlwaysStoppedAnimation(0.2),
            fit: BoxFit.cover,
          ),
        ),

        child

      ],
    );
  }
}
