import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/utils/app_styles.dart';
import 'package:test_app/presentation/screens/user_screen.dart';
import '../cubit/list_users/list_users_cubit.dart';
import '../widgets/card_user_from_the_list.dart';
import '../widgets/primary_scaffold.dart';
import '../widgets/sceletons/skeleton_list_users.dart';

class ListUsersScreen extends StatelessWidget {
  const ListUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListUsersCubit, ListUsersState>(
      builder: (ctx, state) {
        return PrimaryScaffold(
          titleAppBar: "Test task",
          child: state is ListUsersLoaded
              ?Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: state.listUsers.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: ()=>Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) {
                                    return UserScreen(user: state.listUsers[index]);
                                  },
                            )
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 50,
                          height: 113,
                          child: CardUserFromTheListWidget(
                            name: state.listUsers[index].name,
                            userName: state.listUsers[index].userName,
                          ),
                        )
                      );
                    }
                  ),
                ),
              ) : state is ListUserError ? Center(
                    child: Text(state.errorText, style: AppStyles.ordinary16w600,),
                  )
                :const SkeletonListUsersCard(height: 107,),
        );
      },
    );
  }
}
