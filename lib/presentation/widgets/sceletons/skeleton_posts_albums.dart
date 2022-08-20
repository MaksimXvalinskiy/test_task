import 'package:flutter/material.dart';
import 'package:test_app/presentation/widgets/sceletons/skeleton_user_card.dart';

import '../../../config/utils/app_styles.dart';

class SkeletonPostsAlbums extends StatelessWidget {
  const SkeletonPostsAlbums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          child: Text("Posts", style: AppStyles.header18w600,),
          padding: EdgeInsets.only(left: 24),
        ),
        SizedBox(height: 12,),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:  3,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width - 24,
                      child: SkeletonUserCard(height: 158));
                }
            ),
          ),
        ),
        const SizedBox(height: 24,),
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text("Albums", style: AppStyles.header18w600,),
        ),
        const SizedBox(height: 12,),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:  3,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      child: const Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: SkeletonUserCard(height: 174),
                      ));
                }
            ),
          ),
        ),
      ],
    );
  }
}
