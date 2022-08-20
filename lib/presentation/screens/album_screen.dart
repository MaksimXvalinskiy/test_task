import 'package:flutter/material.dart';
import 'package:test_app/domain/entities/album_entity.dart';
import 'package:test_app/presentation/widgets/gallery.dart';
import '../widgets/card_image.dart';
import '../widgets/primary_scaffold.dart';
class AlbumScreen extends StatelessWidget {
  final AlbumEntity album;
  const AlbumScreen({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listCardAlbumWidget = List<Widget>.generate(album.listPhoto.length, (i) {
      return GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return GalleryWidget(
                    listPhoto: album.listPhoto,
                    index: i,
                  );
                },
              )
          );
        },
        child: CardImageWidget(
            urlPhoto: album.listPhoto[i].thumbnailUrl,
            title:  album.listPhoto[i].title
        ),
      );
    });
    return PrimaryScaffold(
      titleAppBar: album.title,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 4,
            runSpacing: 4,
            alignment: WrapAlignment.center,
            children: listCardAlbumWidget,
          ),
        ),
      ),
    );
  }
}

