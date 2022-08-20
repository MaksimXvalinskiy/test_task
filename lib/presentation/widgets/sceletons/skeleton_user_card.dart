import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:test_app/presentation/widgets/sceletons/custom_skeleton_theme.dart';

import '../../../config/utils/app_colors.dart';

class SkeletonUserCard extends StatelessWidget {
  final double height;
  const SkeletonUserCard({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSkeletonTheme(
          colorsGradient: AppColors.colorsGradientSkeleton,
          stopsGradient: AppColors.stopsGradientSkeleton,
          child: SkeletonItem(
            child: SkeletonLine(
              style: SkeletonLineStyle(
                borderRadius: BorderRadius.circular(8),
                width: MediaQuery.of(context).size.width - 30,
                height: height
              ),
            ),
          ),
        ),
        SizedBox(height: 6)
      ],
    );
  }
}