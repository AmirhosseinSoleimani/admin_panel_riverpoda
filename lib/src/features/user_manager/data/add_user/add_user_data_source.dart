import 'package:admin_panel/src/features/user_manager/domain/entity/add_user_entity.dart';
import 'package:admin_panel/src/services/network/dio_config/dio_client.dart';
import 'package:admin_panel/src/services/network/network.dart';
import 'package:injectable/injectable.dart';


@LazySingleton()
class AddUsersDataSource with ApiBase {
  final DioClient _dioClient = DioClient();

  Future addUsers({required String userName, required String email, required String password}) async {
    final response = await makeGetRequest(
      _dioClient.dio.post(
        ApiConfig.getAllUsers,
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