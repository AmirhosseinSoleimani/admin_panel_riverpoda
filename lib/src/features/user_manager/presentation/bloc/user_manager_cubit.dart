
import 'package:admin_panel/src/features/features.dart';
import 'package:admin_panel/src/features/user_manager/domain/entity/all_users_entity.dart';
import 'package:admin_panel/src/features/user_manager/domain/repository/add_user_repository.dart';
import 'package:admin_panel/src/features/user_manager/domain/repository/delete_user_repository.dart';
import 'package:admin_panel/src/features/user_manager/domain/repository/get_all_user_repository.dart';
import 'package:admin_panel/src/features/user_manager/domain/repository/put_user_repository.dart';
import 'package:admin_panel/src/features/user_manager/presentation/bloc/user_manager_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserManagerCubit extends Cubit<UserManagerState> {

  final GetAllUserRepository getAllUserRepository;
  final AddUserRepository addUserRepository;
  final DeleteUserRepository deleteUserRepository;
  final PutUserRepository putUserRepository;

  UserManagerCubit(this.getAllUserRepository, this.addUserRepository, this.deleteUserRepository, this.putUserRepository) : super(const UserManagerState.idle());

  static TextEditingController userNameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static String gender = '';
  static String id = '';




  List<AllUsersEntity> listAllUsers = [];

  Future getAllUsers() async{
    listAllUsers.clear();
    emit(const UserManagerState.loading());
    final result = await getAllUserRepository.getAllUsers();
    result.whenOrNull(
      success: (data) {
        for(var i in data) {
          listAllUsers.add(i);
        }
        emit(const UserManagerState.success());
      },
      failure: (error) {
        emit(UserManagerState.error(errorMessage: error ?? ''));
      },
    );
  }

  Future addUsers(BuildContext context) async{
    emit(const UserManagerState.addUserLoading());
    final result = await addUserRepository.addUsers(userName: userNameController.text, email: emailController.text, password: passwordController.text);
    result.whenOrNull(
      success: (data) {
        getAllUsers();
      },
      failure: (error) {
        emit(UserManagerState.error(errorMessage: error ?? ''));
      },
    );
  }

  Future updateUsers(BuildContext context, String id) async{
    emit(const UserManagerState.addUserLoading());
    final result = await putUserRepository.updateUsers(userName: userNameController.text, email: emailController.text, password: passwordController.text, id: id);
    result.whenOrNull(
      success: (data) {
        getAllUsers();
      },
      failure: (error) {
        emit(UserManagerState.error(errorMessage: error ?? ''));
      },
    );
  }

  Future deleteUsers(BuildContext context, String id) async{
    emit(const UserManagerState.addUserLoading());
    final result = await deleteUserRepository.deleteUsers(id: id);
    result.whenOrNull(
      success: (data) {
        getAllUsers();
      },
      failure: (error) {
        emit(UserManagerState.error(errorMessage: error ?? ''));
      },
    );
  }
}