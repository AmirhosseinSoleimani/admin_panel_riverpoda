import 'package:admin_panel/src/features/upload/data/update_content_video/update_content_video.dart';
import 'package:admin_panel/src/features/user_manager/data/add_user/add_user_data_source.dart';
import 'package:admin_panel/src/features/user_manager/data/put_user_data_source/put_user_data_source.dart';
import 'package:admin_panel/src/features/user_manager/domain/entity/add_user_entity.dart';
import 'package:admin_panel/src/services/network/network_state/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../services/network/repository.dart';


@lazySingleton
class PutContentRepository with GeneralRepository {
  final PutContentDataSource putContentDataSource;

  PutContentRepository({required this.putContentDataSource});

  Future<ApiResult> updateContent({required String title, required String description, required String id}) async {
    try {
      final response = await putContentDataSource.updateContent(title: title, description: description, id: id);
      return ApiResult.success(data: response);
    }on DioException catch(e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}