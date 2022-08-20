import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../config/utils/helpers.dart';
import '../../../domain/entities/user_entity/user_entity.dart';
import '../../../domain/use_cases/caching_of_info_use_cases/caching_users_use_case.dart';
import '../../../domain/use_cases/get_cached_info_use_cases/get_chaced_users_use_case.dart';
import '../../../domain/use_cases/get_remote_info_use_cases/get_remote_users_use_case.dart';

part 'list_users_state.dart';

class ListUsersCubit extends Cubit<ListUsersState> {
  final GetRemoteUsersUseCase getRemoteUsersUseCase;
  final GetCachedUsersUseCase getCachedUsersUseCase;
  final CachingUsersUseCase cachingUsersUseCase;
  ListUsersCubit({
    required this.getRemoteUsersUseCase,
    required this.getCachedUsersUseCase,
    required this.cachingUsersUseCase
  }) : super(ListUsersInitial());

  Future<void> getUsers() async{
    try {
      List<UserEntity> listUsers = await getCachedUsersUseCase();
      if (listUsers.isEmpty) {
        if(!await Helper.checkInternetConnection())
          throw Exception('No internet connection');
        listUsers = await getRemoteUsersUseCase();
        emit(ListUsersLoaded(listUsers: listUsers));
        cachingUsersUseCase(listUsers);
      }else{
        emit(ListUsersLoaded(listUsers: listUsers));
      }
    }catch(e){
      emit(ListUserError(errorText: e.toString()));
    }
  }
}
