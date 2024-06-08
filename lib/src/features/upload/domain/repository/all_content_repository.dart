import 'package:admin_panel/src/features/upload/data/get_all_content/get_all_content.dart';
import 'package:admin_panel/src/features/upload/domain/entity/all_content_entity.dart';
import 'package:admin_panel/src/features/user_manager/data/get_all_users_data_source/get_all_users_data_source.dart';
import 'package:admin_panel/src/features/user_manager/domain/entity/all_users_entity.dart';
import 'package:admin_panel/src/services/network/network_state/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../services/network/repository.dart';


@lazySingleton
class GetAllContentRepository with GeneralRepository<List<AllContentEntity>> {
  final GetAllContentDataSource getAllContentDataSource;

  GetAllContentRepository({required this.getAllContentDataSource});

  Future<ApiResult<List<AllContentEntity>>> getAllContent() async {
    try {
      final response = await getAllContentDataSource.getAllContent();
      return ApiResult.success(data: response);
    }on DioException catch(e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}