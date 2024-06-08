import 'package:admin_panel/src/features/user_manager/data/get_all_users_data_source/get_all_users_data_source.dart';
import 'package:admin_panel/src/features/user_manager/domain/entity/all_users_entity.dart';
import 'package:admin_panel/src/services/network/network_state/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../services/network/repository.dart';


@lazySingleton
class GetAllUserRepository with GeneralRepository<List<AllUsersEntity>> {
  final GetAllUsersDataSource getAllUsersDataSource;

  GetAllUserRepository({required this.getAllUsersDataSource});

  Future<ApiResult<List<AllUsersEntity>>> getAllUsers() async {
    try {
      final response = await getAllUsersDataSource.getAllUsers();
      return ApiResult.success(data: response);
    }on DioException catch(e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}