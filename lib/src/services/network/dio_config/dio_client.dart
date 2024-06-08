import 'package:admin_panel/src/services/network/dio_config/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio dio;
  factory DioClient() => _instance;
  DioClient._internal() {
    dio = Dio(
        BaseOptions(
          responseType: ResponseType.json,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        )
    )..interceptors.add(PrettyDioLogger());
  }
}