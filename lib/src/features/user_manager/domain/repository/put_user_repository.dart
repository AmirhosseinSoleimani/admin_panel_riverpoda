import 'package:admin_panel/src/features/user_manager/data/add_user/add_user_data_source.dart';
import 'package:admin_panel/src/features/user_manager/data/put_user_data_source/put_user_data_source.dart';
import 'package:admin_panel/src/features/user_manager/domain/entity/add_user_entity.dart';
import 'package:admin_panel/src/services/network/network_state/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../services/network/repository.dart';


@lazySingleton
class PutUserRepository with GeneralRepository {
  final PutUsersDataSource putUsersDataSource;

  PutUserRepository({required this.putUsersDataSource});

  Future<ApiResult> updateUsers({required String userName, required String email, required String password, required String id}) async {
    try {
      final response = await putUsersDataSource.updateUsers(userName: userName, email: email, password: password, id: id);
      return ApiResult.success(data: response);
    }on DioException catch(e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}