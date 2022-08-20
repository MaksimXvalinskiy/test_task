import 'package:flutter/material.dart';
import 'package:test_app/config/utils/app_colors.dart';
import 'package:test_app/config/utils/app_styles.dart';
import 'package:test_app/domain/entities/post_entity.dart';
import 'package:test_app/presentation/cubit/post/post_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/injection_container.dart' as di;
import 'package:test_app/presentation/widgets/card_comment.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/primary_scaffold.dart';

class PostScreen extends StatelessWidget {
  final PostEntity post;

  const PostScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<PostCubit>()..getComments(post.listComments),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return state is PostLoaded ?
          PrimaryScaffold(
            titleAppBar: post.title,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.comment),
              onPressed: (){
                CustomBottomSheet.get(
                    idPost: post.id,
                    state: state,
                    context: context,
                    title: "Add comment",
                    function: context.read<PostCubit>().addNewComment
                );
              },
            ),
            child: WillPopScope(
              onWillPop: () async{
                Navigator.pop(context, state.listComments);
                return false;
              },
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 92,
                    child: ListView.builder(
                        itemCount: state.listComments.length+1,
                        itemBuilder: (context, index) {
                          if(index == 0) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.title,
                                    style: AppStyles.header18w700,
                                  ),
                                  const SizedBox(height: 8,),
                                  Text(
                                    post.body,
                                    style: AppStyles.ordinary15w500,
                                  )
                                ],
                              ),
                            );
                          }
                          else return CardCommentWidget(
                            comment: state.listComments[state.listComments.length-index],
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          ): const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
