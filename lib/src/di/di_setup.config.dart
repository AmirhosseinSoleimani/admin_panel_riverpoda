// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/upload/data/get_all_content/get_all_content.dart' as _i3;
import '../features/upload/data/update_content_video/update_content_video.dart'
    as _i4;
import '../features/upload/domain/repository/all_content_repository.dart'
    as _i14;
import '../features/upload/domain/repository/update_content_repository.dart'
    as _i12;
import '../features/upload/presentation/bloc/uplead_cubit.dart' as _i16;
import '../features/user_manager/data/add_user/add_user_data_source.dart'
    as _i5;
import '../features/user_manager/data/delete_user_data_source/delete_user_data_source.dart'
    as _i6;
import '../features/user_manager/data/get_all_users_data_source/get_all_users_data_source.dart'
    as _i7;
import '../features/user_manager/data/put_user_data_source/put_user_data_source.dart'
    as _i8;
import '../features/user_manager/domain/repository/add_user_repository.dart'
    as _i13;
import '../features/user_manager/domain/repository/delete_user_repository.dart'
    as _i11;
import '../features/user_manager/domain/repository/get_all_user_repository.dart'
    as _i9;
import '../features/user_manager/domain/repository/put_user_repository.dart'
    as _i10;
import '../features/user_manager/presentation/bloc/user_manager_cubit.dart'
    as _i15;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.GetAllContentDataSource>(
      () => _i3.GetAllContentDataSource());
  gh.lazySingleton<_i4.PutContentDataSource>(() => _i4.PutContentDataSource());
  gh.lazySingleton<_i5.AddUsersDataSource>(() => _i5.AddUsersDataSource());
  gh.lazySingleton<_i6.DeleteUsersDataSource>(
      () => _i6.DeleteUsersDataSource());
  gh.lazySingleton<_i7.GetAllUsersDataSource>(
      () => _i7.GetAllUsersDataSource());
  gh.lazySingleton<_i8.PutUsersDataSource>(() => _i8.PutUsersDataSource());
  gh.lazySingleton<_i9.GetAllUserRepository>(() => _i9.GetAllUserRepository(
      getAllUsersDataSource: gh<_i7.GetAllUsersDataSource>()));
  gh.lazySingleton<_i10.PutUserRepository>(() =>
      _i10.PutUserRepository(putUsersDataSource: gh<_i8.PutUsersDataSource>()));
  gh.lazySingleton<_i11.DeleteUserRepository>(() => _i11.DeleteUserRepository(
      deleteUsersDataSource: gh<_i6.DeleteUsersDataSource>()));
  gh.lazySingleton<_i12.PutContentRepository>(() => _i12.PutContentRepository(
      putContentDataSource: gh<_i4.PutContentDataSource>()));
  gh.lazySingleton<_i13.AddUserRepository>(() =>
      _i13.AddUserRepository(addUsersDataSource: gh<_i5.AddUsersDataSource>()));
  gh.lazySingleton<_i14.GetAllContentRepository>(() =>
      _i14.GetAllContentRepository(
          getAllContentDataSource: gh<_i3.GetAllContentDataSource>()));
  gh.factory<_i15.UserManagerCubit>(() => _i15.UserManagerCubit(
        gh<_i9.GetAllUserRepository>(),
        gh<_i13.AddUserRepository>(),
        gh<_i11.DeleteUserRepository>(),
        gh<_i10.PutUserRepository>(),
      ));
  gh.factory<_i16.UploadCubit>(() => _i16.UploadCubit(
        gh<_i14.GetAllContentRepository>(),
        gh<_i12.PutContentRepository>(),
      ));
  return getIt;
}
