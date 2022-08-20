import 'package:flutter/material.dart';
import 'package:test_app/presentation/screens/album_screen.dart';
import 'package:test_app/presentation/widgets/card_image.dart';

import '../../domain/entities/album_entity.dart';
import '../widgets/primary_scaffold.dart';

class AlbumList extends StatelessWidget {
  final List<AlbumEntity> listAlbums;
  final String nameUser;
  const AlbumList({
    Key? key,
    required this.listAlbums,
    required this.nameUser
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listCardAlbumWidget = List<Widget>.generate(listAlbums.length, (i) {
      return GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return AlbumScreen(album: listAlbums[i]);
                },
              )
          );
        },
        child: CardImageWidget(
            urlPhoto: listAlbums[i].listPhoto[0].thumbnailUrl,
            title:  listAlbums[i].title
        ),
      );
    });
    return PrimaryScaffold(
      titleAppBar: nameUser + " albums",
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
