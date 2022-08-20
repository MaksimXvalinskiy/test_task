import 'package:flutter/material.dart';
import 'package:test_app/config/utils/app_styles.dart';
import 'package:test_app/domain/entities/comment_entity.dart';

class CardCommentWidget extends StatelessWidget {
  final CommentEntity comment;
  const CardCommentWidget({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(15.0),
          ),
        ),
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment.name,
                style: AppStyles.ordinary15w600,
              ),
              SizedBox(height: 4,),
              Text(
                comment.email,
                style: AppStyles.ordinary15w500,
              ),
              SizedBox(height: 8,),
              Text(
                comment.body,
                style: AppStyles.ordinary14w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
