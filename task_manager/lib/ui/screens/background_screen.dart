import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/asset_paths.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key, required this.child});


  /**
   * 1. This is custom background screen
   * 2. We take a child widget because when the background screen apply, through the child widget we can
   *    design the entire screen
   */
  final Widget child;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AssetPaths.backGroundImage1,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),

        SafeArea(child: child),

      ],
    );
  }
}
