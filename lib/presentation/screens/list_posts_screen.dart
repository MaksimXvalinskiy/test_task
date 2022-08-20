import 'package:flutter/material.dart';
import 'package:test_app/domain/entities/post_entity.dart';
import 'package:test_app/presentation/cubit/list_posts/lists_posts_cubit.dart';
import 'package:test_app/presentation/screens/post_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/injection_container.dart' as di;
import 'package:test_app/presentation/widgets/card_post.dart';

import '../widgets/primary_scaffold.dart';

class ListPostsScreen extends StatelessWidget {
  final List<PostEntity> listPosts;
  final String nameUser;
  const ListPostsScreen({
    Key? key,
    required this.listPosts,
    required this.nameUser,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<ListPostsCubit>()..getInfo(listPosts),
      child: BlocBuilder<ListPostsCubit, ListsPostsState>(
        builder: (context, state) {
          return state is ListPostsLoaded ?PrimaryScaffold(
            titleAppBar: nameUser + " posts",
            child: WillPopScope(
              onWillPop: () async{
                Navigator.pop(context, state.listPosts);
                return false;
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: state.listPosts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                              context.read<ListPostsCubit>().refreshCommentsCount(
                                  index,
                                  newListComments,
                                  state.listPosts
                              );
                            },
                            child: SizedBox(
                              height: 188,
                              child: CardPostWidget(
                                body: state.listPosts[index].body,
                                countComments: state.listPosts[index].listComments.length,
                                titlePost: state.listPosts[index].title,
                              ),
                            ),
                          ),
                      );
                    }
                ),
              ),
            ),
        ):const SizedBox();
        },
      ),
    );
  }
}
