import 'package:admin_panel/src/features/user_manager/domain/entity/all_users_entity.dart';
import 'package:admin_panel/src/services/network/dio_config/dio_client.dart';
import 'package:admin_panel/src/services/network/network.dart';
import 'package:injectable/injectable.dart';


@LazySingleton()
class PutUsersDataSource with ApiBase {
  final DioClient _dioClient = DioClient();

  Future updateUsers({required String userName, required String email, required String password, required String id}) async {
    final response = await makeGetRequest(
      _dioClient.dio.put(
          '${ApiConfig.getAllUsers}/$id',
          data: {
            "userName": userName,
            "email": email,
            "password": password
          }
      ),
    );
    return response.data;
  }
}