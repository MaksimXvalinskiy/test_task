import 'package:flutter/material.dart';
import 'package:test_app/config/utils/app_colors.dart';
import 'package:test_app/config/utils/app_styles.dart';
import 'package:test_app/presentation/widgets/card_user_info.dart';

import '../../domain/entities/user_entity/user_entity.dart';

class UserInfoWidget extends StatelessWidget {
  final UserEntity user;
  const UserInfoWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(user.name, style: AppStyles.header18w700,),
          ),
          const SizedBox(height: 24),
          CardUserInfoWidget(
            listInfo: [
              TextSpan(
                  children: [
                    const TextSpan(text: "Email: ", style: AppStyles.header18w600,),
                    TextSpan(
                      text: user.email,
                      style: AppStyles.ordinary16w500,
                    ),
                  ]
              ),
              TextSpan(
                  children: [
                    const TextSpan(text: "Phone: ", style: AppStyles.header18w600,),
                    TextSpan(
                      text: user.phone,
                      style: AppStyles.ordinary16w500,
                    ),
                  ]
              ),
              TextSpan(
                  children: [
                    const TextSpan(text: "Website: ", style: AppStyles.header18w600,),
                    TextSpan(
                      text: user.website,
                      style: AppStyles.ordinary16w500,
                    ),
                  ]
              )
            ],
            titleCard: "Contacts",
            backgroundColor: AppColors.primaryScaffold,

          ),
          const SizedBox(height: 24),
          CardUserInfoWidget(
            listInfo: [
              TextSpan(
                  children: [
                    const TextSpan(text: "Name: ", style: AppStyles.header18w600,),
                    TextSpan(
                      text: user.company.name,
                      style: AppStyles.ordinary16w500,
                    ),
                  ]
              ),
              TextSpan(
                  children: [
                    const TextSpan(text: "B.S: ", style: AppStyles.header18w600,),
                    TextSpan(
                      text: user.company.bs,
                      style: AppStyles.ordinary16w500,
                    ),
                  ]
              ),
              TextSpan(
                  children: [
                    const TextSpan(text: "Catch Phrase: ", style: AppStyles.header18w600,),
                    TextSpan(
                      text: user.company.catchPhrase,
                      style: AppStyles.ordinary16w500Italic,
                    ),
                  ]
              )
            ],
            titleCard: "Company",
            backgroundColor: AppColors.primaryScaffold,

          ),
          const SizedBox(height: 24,),
          CardUserInfoWidget(
            listInfo: [
              TextSpan(
                  children: [
                    const TextSpan(text: "City: ", style: AppStyles.header18w600,),
                    TextSpan(
                      text: user.address.city,
                      style: AppStyles.ordinary16w500,
                    ),
                  ]
              ),
              TextSpan(
                  children: [
                    const TextSpan(text: "Suite: ", style: AppStyles.header18w600,),
                    TextSpan(
                      text: user.address.suite,
                      style: AppStyles.ordinary16w500,
                    ),
                  ]
              ),
              TextSpan(
                  children: [
                    const TextSpan(text: "Street: ", style: AppStyles.header18w600,),
                    TextSpan(
                      text: user.address.street,
                      style: AppStyles.ordinary16w500,
                    ),
                  ]
              ),
              TextSpan(
                  children: [
                    const TextSpan(text: "Zipcode: ", style: AppStyles.header18w600,),
                    TextSpan(
                      text: user.address.zipcode,
                      style: AppStyles.ordinary16w500,
                    ),
                  ]
              ),
              TextSpan(
                  children: [
                    const TextSpan(text: "Geoposition: ", style: AppStyles.header18w600,),
                    TextSpan(
                      text: user.address.geo.lat.toString()
                          +', '+user.address.geo.lng.toString(),
                      style: AppStyles.ordinary16w500,
                    ),
                  ]
              )
            ],
            titleCard: "Address",
            backgroundColor: AppColors.primaryScaffold,

          ),
        ],
      ),
    );
  }
}
