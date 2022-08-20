import 'package:flutter/cupertino.dart';
import 'package:test_app/config/utils/app_colors.dart';
import 'package:test_app/presentation/widgets/sceletons/custom_skeleton_theme.dart';
import 'package:test_app/presentation/widgets/sceletons/skeleton_user_card.dart';

class SkeletonListUsersCard extends StatelessWidget {
  final double height;
  const SkeletonListUsersCard({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
      child: CustomSkeletonTheme(
        colorsGradient: AppColors.colorsGradientSkeleton,
        stopsGradient: AppColors.stopsGradientSkeleton,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index){
            return SkeletonUserCard(height: height,);
          },
        ),
      ),
    );
  }
}
