import 'package:admin_panel/src/services/network/network_state/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../services/network/repository.dart';
import '../../data/delete_user_data_source/delete_user_data_source.dart';


@lazySingleton
class DeleteUserRepository with GeneralRepository {
  final DeleteUsersDataSource deleteUsersDataSource;

  DeleteUserRepository({required this.deleteUsersDataSource});

  Future<ApiResult> deleteUsers({required String id}) async {
    try {
      final response = await deleteUsersDataSource.deleteUsers(id: id);
      return ApiResult.success(data: response);
    }on DioException catch(e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}