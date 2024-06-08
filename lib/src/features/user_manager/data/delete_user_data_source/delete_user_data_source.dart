import 'package:admin_panel/src/services/network/dio_config/dio_client.dart';
import 'package:admin_panel/src/services/network/network.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteUsersDataSource with ApiBase {
  final DioClient _dioClient = DioClient();

  Future deleteUsers({required String id}) async {
    final response = await makeGetRequest(
      _dioClient.dio.delete(
        '${ApiConfig.getAllUsers}/$id',
      ),
    );
  }
}