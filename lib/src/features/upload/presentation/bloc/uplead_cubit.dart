import 'package:admin_panel/src/features/upload/domain/entity/all_content_entity.dart';
import 'package:admin_panel/src/features/upload/domain/repository/all_content_repository.dart';
import 'package:admin_panel/src/features/upload/domain/repository/update_content_repository.dart';
import 'package:admin_panel/src/features/upload/presentation/bloc/upload_state.dart';
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
class UploadCubit extends Cubit<UploadState> {

  final GetAllContentRepository getAllContentRepository;
  final PutContentRepository putContentRepository;

  UploadCubit(this.getAllContentRepository, this.putContentRepository) : super(const UploadState.idle());

  // static TextEditingController userNameController = TextEditingController();
  // static TextEditingController passwordController = TextEditingController();
  // static TextEditingController emailController = TextEditingController();
  // static String gender = '';
  // static String id = '';


  static String url = '';
  static String title = '';
  static String description = '';
  static String id = '';


  List<AllContentEntity> listAllContents = [];

  Future getAllContent() async{
    listAllContents.clear();
    emit(const UploadState.loading());
    final result = await getAllContentRepository.getAllContent();
    result.whenOrNull(
      success: (data) {
        for(var i in data) {
          listAllContents.add(i);
        }
        emit(const UploadState.success());
      },
      failure: (error) {
        emit(UploadState.error(errorMessage: error ?? ''));
      },
    );
  }
  //
  // Future addUsers(BuildContext context) async{
  //   emit(const UserManagerState.addUserLoading());
  //   final result = await addUserRepository.addUsers(userName: userNameController.text, email: emailController.text, password: passwordController.text);
  //   result.whenOrNull(
  //     success: (data) {
  //       getAllUsers();
  //     },
  //     failure: (error) {
  //       emit(UserManagerState.error(errorMessage: error ?? ''));
  //     },
  //   );
  // }
  //
  Future updateUsers(String title, String description) async{
    // emit(const UploadState.updateContentLoading());
    final result = await putContentRepository.updateContent(title: title, description: description, id: id);
    result.whenOrNull(
      success: (data) {
        getAllContent();
      },
      failure: (error) {
        emit(UploadState.error(errorMessage: error ?? ''));
      },
    );
  }
  //
  // Future deleteUsers(BuildContext context, String id) async{
  //   emit(const UserManagerState.addUserLoading());
  //   final result = await deleteUserRepository.deleteUsers(id: id);
  //   result.whenOrNull(
  //     success: (data) {
  //       getAllUsers();
  //     },
  //     failure: (error) {
  //       emit(UserManagerState.error(errorMessage: error ?? ''));
  //     },
  //   );
  // }
}