// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/user_manager/data/add_user/add_user_data_source.dart'
    as _i4;
import '../features/user_manager/data/delete_user_data_source/delete_user_data_source.dart'
    as _i5;
import '../features/user_manager/data/get_all_users_data_source/get_all_users_data_source.dart'
    as _i3;
import '../features/user_manager/data/put_user_data_source/put_user_data_source.dart'
    as _i6;
import '../features/user_manager/domain/repository/add_user_repository.dart'
    as _i10;
import '../features/user_manager/domain/repository/delete_user_repository.dart'
    as _i9;
import '../features/user_manager/domain/repository/get_all_user_repository.dart'
    as _i7;
import '../features/user_manager/domain/repository/put_user_repository.dart'
    as _i8;
import '../features/user_manager/presentation/bloc/user_manager_cubit.dart'
    as _i11;

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
  gh.lazySingleton<_i3.GetAllUsersDataSource>(
      () => _i3.GetAllUsersDataSource());
  gh.lazySingleton<_i4.AddUsersDataSource>(() => _i4.AddUsersDataSource());
  gh.lazySingleton<_i5.DeleteUsersDataSource>(
      () => _i5.DeleteUsersDataSource());
  gh.lazySingleton<_i6.PutUsersDataSource>(() => _i6.PutUsersDataSource());
  gh.lazySingleton<_i7.GetAllUserRepository>(() => _i7.GetAllUserRepository(
      getAllUsersDataSource: gh<_i3.GetAllUsersDataSource>()));
  gh.lazySingleton<_i8.PutUserRepository>(() =>
      _i8.PutUserRepository(putUsersDataSource: gh<_i6.PutUsersDataSource>()));
  gh.lazySingleton<_i9.DeleteUserRepository>(() => _i9.DeleteUserRepository(
      deleteUsersDataSource: gh<_i5.DeleteUsersDataSource>()));
  gh.lazySingleton<_i10.AddUserRepository>(() =>
      _i10.AddUserRepository(addUsersDataSource: gh<_i4.AddUsersDataSource>()));
  gh.factory<_i11.UserManagerCubit>(() => _i11.UserManagerCubit(
        gh<_i7.GetAllUserRepository>(),
        gh<_i10.AddUserRepository>(),
        gh<_i9.DeleteUserRepository>(),
        gh<_i8.PutUserRepository>(),
      ));
  return getIt;
}
