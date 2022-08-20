import 'package:flutter/material.dart';
import 'package:test_app/config/utils/app_colors.dart';
import 'package:test_app/config/utils/app_styles.dart';

class CardPostWidget extends StatelessWidget {
  final String titlePost;
  final int countComments;
  final String body;
  const CardPostWidget({
    Key? key,
    required this.titlePost,
    required this.countComments,
    required this.body
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titlePost,
                  style: AppStyles.header18w600,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  body,
                  style: AppStyles.ordinary15w500.copyWith(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(Icons.comment, color: Color(0xffF0F0F0),),
                    SizedBox(width: 4,),
                    Text(
                        countComments.toString() + " комментариев",
                        style: AppStyles.ordinary16w500,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
