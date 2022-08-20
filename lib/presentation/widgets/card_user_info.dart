import 'package:flutter/material.dart';

import '../../config/utils/app_styles.dart';

class CardUserInfoWidget extends StatelessWidget {
  final Color backgroundColor;
  final List<dynamic> listInfo;
  final String titleCard;
  const CardUserInfoWidget({
    Key? key,
    required this.backgroundColor,
    required this.listInfo,
    required this.titleCard
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listInfoWidget = List<Widget>.generate(listInfo.length, (i) {
      return RichText(
        text: listInfo[i]
      );
    });
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Text(titleCard, style: AppStyles.header18w700,)
              ),
              SizedBox(height: 8,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: listInfoWidget,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
