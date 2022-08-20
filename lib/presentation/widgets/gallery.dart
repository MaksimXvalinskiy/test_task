import 'package:flutter/material.dart';
import 'package:test_app/config/utils/app_styles.dart';
import 'package:test_app/presentation/widgets/primary_scaffold.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../config/utils/app_colors.dart';
import '../../domain/entities/photo_entity.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
class GalleryWidget extends StatelessWidget {
  final List<PhotoEntity> listPhoto;
  final int index;
  const GalleryWidget({
    Key? key,
    required this.listPhoto,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
        titleAppBar: listPhoto[index].title,
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions.customChild(
              child: Container(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      listPhoto[index].title,
                      style: AppStyles.header18w700,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        listPhoto[index].url,
                    ),
                  )
                ),
              ),
              initialScale: PhotoViewComputedScale.contained * 0.8,
            );
          },
          itemCount: listPhoto.length,
          loadingBuilder: (context, event) => CachedNetworkImage(imageUrl: listPhoto[index].thumbnailUrl),
          backgroundDecoration: BoxDecoration(color: AppColors.primaryScaffold),
          pageController:PageController(initialPage: index),
        )
    );
  }
}
