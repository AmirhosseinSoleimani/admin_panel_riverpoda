import 'package:admin_panel/src/features/user_manager/domain/entity/all_users_entity.dart';
import 'package:admin_panel/src/services/network/dio_config/dio_client.dart';
import 'package:admin_panel/src/services/network/network.dart';
import 'package:injectable/injectable.dart';


@LazySingleton()
class GetAllUsersDataSource with ApiBase<List<AllUsersEntity>> {
  final DioClient _dioClient = DioClient();

  Future<List<AllUsersEntity>> getAllUsers() async {
    final response = await makeGetRequest(
      _dioClient.dio.get(
        ApiConfig.getAllUsers,

      ),
    );
    List<AllUsersEntity> listAllUsers = [];
    for(var item in response.data) {
      AllUsersEntity user = AllUsersEntity.fromJson(item);
      listAllUsers.add(user);
    }
    return listAllUsers;
  }
}