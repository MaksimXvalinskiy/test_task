import 'package:flutter/material.dart';
import 'package:test_app/config/utils/app_styles.dart';
import 'package:test_app/presentation/screens/list_albums_screen.dart';
import 'package:test_app/presentation/screens/album_screen.dart';
import 'package:test_app/presentation/screens/post_screen.dart';
import 'package:test_app/presentation/widgets/card_image.dart';
import 'package:test_app/presentation/widgets/card_post.dart';
import 'package:test_app/presentation/widgets/sceletons/skeleton_posts_albums.dart';
import '../../domain/entities/user_entity/user_entity.dart';
import '../cubit/user/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/injection_container.dart' as di;

import '../widgets/primary_scaffold.dart';
import '../widgets/user_info.dart';
import 'list_posts_screen.dart';
class UserScreen extends StatelessWidget {
  final UserEntity user;
  const UserScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<UserCubit>()..getInfo(user.id),
        child: PrimaryScaffold(
          titleAppBar: user.userName,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                UserInfoWidget(user: user,),
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return state is UserLoaded ?
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 24, left: 24),
                            child: Row(
                              children: [
                                const Text("Posts", style: AppStyles.header18w600,),
                                GestureDetector(
                                  onTap: () async{
                                      dynamic newListPost = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return ListPostsScreen(
                                                  listPosts: state.listPosts,
                                                  nameUser: user.userName
                                              );
                                            },
                                          )
                                      );
                                      context.read<UserCubit>().refreshListPosts(newListPost, state.listAlbum);
                                  },
                                  child: const Text(
                                      "View all",
                                      style: AppStyles.ordinary14w500,
                                  ),
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ),
                          SizedBox(
                            height: 188,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.listPosts.length > 3 ? 3: state.listPosts.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width - 24,
                                  height: 188,
                                  child: GestureDetector(
                                    onTap:() async{
                                      dynamic newListComments = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return PostScreen(post: state.listPosts[index]);
                                          },
                                        )
                                      );
                                      context.read<UserCubit>().refreshCommentsCount(index, newListComments, state);
                                    },
                                    child: CardPostWidget(
                                      body: state.listPosts[index].body,
                                      countComments: state.listPosts[index].listComments.length,
                                      titlePost: state.listPosts[index].title,
                                    )
                                  ),
                                );
                              }
                            ),
                          ),
                          SizedBox(height: 24,),
                          Container(
                            padding: EdgeInsets.only(right: 24, left: 24),
                            child: Row(
                              children: [
                                const  Text("Albums", style: AppStyles.header18w600,),
                                GestureDetector(
                                  onTap: ()=>Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return AlbumList(
                                              listAlbums: state.listAlbum,
                                              nameUser: user.name,
                                          );
                                        },
                                      )
                                  ),
                                  child: const Text(
                                    "View all",
                                    style: AppStyles.ordinary14w500,
                                  ),
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ),
                          SizedBox(height: 12,),
                          SizedBox(
                            height: 225,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.listAlbum.length > 3 ?
                                 3: state.listAlbum.length,
                                itemBuilder: (context, index){
                                  return GestureDetector(
                                    onTap: () async{
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return AlbumScreen(album: state.listAlbum[index]);
                                            },
                                          )
                                      );
                                    },
                                    child: CardImageWidget(
                                      urlPhoto: state.listAlbum[index].listPhoto[0].thumbnailUrl,
                                      title: state.listAlbum[index].listPhoto[0].title,
                                    ),
                                  );
                                }
                            ),
                          ),
                        ],
                      )
                        :  state is UserError?
                          Center(
                            child: Text(
                              state.error,
                              style: AppStyles.header18w700,
                            ),
                          )
                          : SkeletonPostsAlbums();
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}
