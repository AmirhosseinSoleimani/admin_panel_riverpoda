

import 'package:admin_panel/src/features/upload/data/upload_video/upload_video.dart';
import 'package:admin_panel/src/services/network/network.dart';
import 'package:admin_panel/src/services/network/network_state/api_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UploadRepository with GeneralRepository {
  final UploadDataSource uploadDataSource;

  UploadRepository({required this.uploadDataSource});

  Future<ApiResult> uploadVideo({required FormData formData, required Function(int, int) onSendProgress,}) async {
    try {
      final response = await uploadDataSource.uploadContent(formData, onSendProgress);
      return ApiResult.success(data: response);
    }on DioException catch(e) {
      return ApiResult.failure(error: e.response?.data['message'].toString());
    }
  }
}