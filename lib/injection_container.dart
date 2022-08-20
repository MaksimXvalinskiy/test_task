import 'package:get_it/get_it.dart';
import 'package:test_app/data/datasource/local_datasource/local_datasource.dart';
import 'package:test_app/data/datasource/local_datasource/local_datasource_impl.dart';
import 'package:test_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:test_app/data/datasource/remote_datasource/remote_datasoure_impl.dart';
import 'package:test_app/data/repositories/local_repository_impl.dart';
import 'package:test_app/data/repositories/remote_repository_impl.dart';
import 'package:test_app/domain/repositories/remote_repository.dart';
import 'package:test_app/domain/use_cases/caching_of_info_use_cases/caching_albums_use_case.dart';
import 'package:test_app/domain/use_cases/caching_of_info_use_cases/caching_comments_use_case.dart';
import 'package:test_app/domain/use_cases/caching_of_info_use_cases/caching_photos_use_case.dart';
import 'package:test_app/domain/use_cases/caching_of_info_use_cases/caching_posts_use_case.dart';
import 'package:test_app/domain/use_cases/caching_of_info_use_cases/caching_users_use_case.dart';
import 'package:test_app/domain/use_cases/get_cached_info_use_cases/get_cached_albums_use_case.dart';
import 'package:test_app/domain/use_cases/get_cached_info_use_cases/get_chaced_comments_use_case.dart';
import 'package:test_app/domain/use_cases/get_cached_info_use_cases/get_chaced_photos_use_case.dart';
import 'package:test_app/domain/use_cases/get_cached_info_use_cases/get_chaced_posts_use_case.dart';
import 'package:test_app/domain/use_cases/get_cached_info_use_cases/get_chaced_users_use_case.dart';
import 'package:test_app/domain/use_cases/get_remote_info_use_cases/get_remote_albums_use_case.dart';
import 'package:test_app/domain/use_cases/get_remote_info_use_cases/get_remote_comments_use_case.dart';
import 'package:test_app/domain/use_cases/get_remote_info_use_cases/get_remote_photos_use_case.dart';
import 'package:test_app/domain/use_cases/get_remote_info_use_cases/get_remote_posts_use_case.dart';
import 'package:test_app/domain/use_cases/get_remote_info_use_cases/get_remote_users_use_case.dart';
import 'package:test_app/domain/use_cases/send_info_use_cases/send_comment_use_case.dart';
import 'package:test_app/presentation/cubit/list_posts/lists_posts_cubit.dart';
import 'package:test_app/presentation/cubit/list_users/list_users_cubit.dart';
import 'package:test_app/presentation/cubit/post/post_cubit.dart';
import 'package:test_app/presentation/cubit/user/user_cubit.dart';
import 'domain/repositories/local_repository.dart';

final sl = GetIt.instance;

Future<void> init() async{

  // region Datasource
  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImplement());
  sl.registerLazySingleton<LocalDatasource>(() => LocalDatasourceImplement());
  // endregion

  // region Repositories
  sl.registerLazySingleton<RemoteRepository>(() =>
      RemoteRepositoryImplement(remoteDatasource: sl.call()));
  sl.registerLazySingleton<LocalRepository>(() =>
      LocalRepositoryImplement(localDatasource: sl.call()));
  // endregion

  // region Use Cases

  // region caching of info use cases
  sl.registerLazySingleton<CachingAlbumsUseCase>(() =>
      CachingAlbumsUseCase(repository: sl.call()));
  sl.registerLazySingleton<CachingCommentsUseCase>(() =>
      CachingCommentsUseCase(repository: sl.call()));
  sl.registerLazySingleton<CachingPhotosUseCase>(() =>
      CachingPhotosUseCase(repository: sl.call()));
  sl.registerLazySingleton<CachingPostsUseCase>(() =>
      CachingPostsUseCase(repository: sl.call()));
  sl.registerLazySingleton<CachingUsersUseCase>(() =>
      CachingUsersUseCase(repository: sl.call()));
  // endregion

  // region get cached info use cases
  sl.registerLazySingleton<GetCachedAlbumsUseCase>(() =>
      GetCachedAlbumsUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCachedCommentsUseCase>(() =>
      GetCachedCommentsUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCachedPhotosUseCase>(() =>
      GetCachedPhotosUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCachedPostsUseCase>(() =>
      GetCachedPostsUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCachedUsersUseCase>(() =>
      GetCachedUsersUseCase(repository: sl.call()));
  // endregion

  // region get remote info use cases
  sl.registerLazySingleton<GetRemoteAlbumsUseCase>(() =>
      GetRemoteAlbumsUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetRemoteCommentsUseCase>(() =>
      GetRemoteCommentsUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetRemotePhotosUseCase>(() =>
      GetRemotePhotosUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetRemotePostsUseCase>(() =>
      GetRemotePostsUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetRemoteUsersUseCase>(() =>
      GetRemoteUsersUseCase(repository: sl.call()));
  // endregion

  // region send info use cases
  sl.registerLazySingleton<SendCommentUseCase>(() =>
      SendCommentUseCase(repository: sl.call()));
  // endregion

  // endregion

  // region Cubit
  sl.registerFactory<ListUsersCubit>(() =>
      ListUsersCubit(
          getRemoteUsersUseCase: sl.call(),
          getCachedUsersUseCase: sl.call(),
          cachingUsersUseCase: sl.call()
      )
  );
  sl.registerFactory<UserCubit>(() =>
      UserCubit(
          getRemotePostsUseCase: sl.call(),
          getRemoteAlbumsUseCase: sl.call(),
          cachingAlbumsUseCase:  sl.call(),
          cachingPostsUseCase: sl.call(),
          getCachedAlbumsUseCase: sl.call(),
          getCachedPostsUseCase: sl.call()
      )
  );
  sl.registerFactory<PostCubit>(() =>
      PostCubit(
          sendCommentUseCase: sl.call(),
        cachingCommentUseCase: sl.call(),
      )
  );
  sl.registerFactory<ListPostsCubit>(() =>
      ListPostsCubit()
  );
  // endregion
}