
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_manager_state.freezed.dart';

@freezed
class UserManagerState with _$UserManagerState {


  const factory UserManagerState.idle() = UserManagerStateIdle;

  const factory UserManagerState.error({required String errorMessage}) = UserManagerStateError;

  const factory UserManagerState.success() = UserManagerStateSuccess;

  const factory UserManagerState.loading() = UserManagerStateLoading;

  const factory UserManagerState.addUserSuccess() = UserManagerStateAddUserSuccess;

  const factory UserManagerState.addUserLoading() = UserManagerStateAddUserLoading;

  const factory UserManagerState.deleteUserSuccess() = UserManagerStateDeleteUserSuccess;

  const factory UserManagerState.deleteUserLoading() = UserManagerStateDeleteUserLoading;

}