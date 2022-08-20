import 'package:flutter/material.dart';
import 'package:test_app/config/utils/app_colors.dart';
import 'package:test_app/config/utils/app_styles.dart';

class CardUserFromTheListWidget extends StatelessWidget {
  final String name;
  final String userName;
  const CardUserFromTheListWidget({
    Key? key,
    required this.name,
    required this.userName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              userName,
              style: AppStyles.header24w700,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4,),
            Text(
              name,
              style: AppStyles.header20w600,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
