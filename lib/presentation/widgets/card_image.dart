import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_app/config/utils/app_styles.dart';
import 'package:test_app/presentation/widgets/sceletons/skeleton_user_card.dart';

class CardImageWidget extends StatelessWidget {
  final String urlPhoto;
  final String title;
  const CardImageWidget({
    Key? key,
    required this.urlPhoto,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
             Radius.circular(15.0)
        ),
      ),
      child: Container(
          width: MediaQuery.of(context).size.width / 2 - 24,
          height: 225,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)
                ),
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width / 2 - 24,
                  height: 150,
                  imageUrl: urlPhoto,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SkeletonUserCard(height: 150 - 6),
                  errorWidget: (context, url, error) => const SkeletonUserCard(height: 150 - 6),
                ),
              ),
              Text(
                title,
                style: AppStyles.ordinary14w400,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ]
          ),
      ),
    );
  }
}
