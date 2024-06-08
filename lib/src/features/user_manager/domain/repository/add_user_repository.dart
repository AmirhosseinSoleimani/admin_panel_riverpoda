import 'package:admin_panel/src/features/user_manager/data/add_user/add_user_data_source.dart';
import 'package:admin_panel/src/features/user_manager/domain/entity/add_user_entity.dart';
import 'package:admin_panel/src/services/network/network_state/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../services/network/repository.dart';


@lazySingleton
class AddUserRepository with GeneralRepository {
  final AddUsersDataSource addUsersDataSource;

  AddUserRepository({required this.addUsersDataSource});

  Future<ApiResult> addUsers({required String userName, required String email, required String password}) async {
    try {
      final response = await addUsersDataSource.addUsers(userName: userName, email: email, password: password);
      return ApiResult.success(data: response);
    }on DioException catch(e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}