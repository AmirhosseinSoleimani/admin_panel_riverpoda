import 'package:admin_panel/src/features/user_manager/domain/entity/all_users_entity.dart';
import 'package:admin_panel/src/services/network/dio_config/dio_client.dart';
import 'package:admin_panel/src/services/network/network.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/all_content_entity.dart';


@LazySingleton()
class GetAllContentDataSource with ApiBase<List<AllContentEntity>> {
  final DioClient _dioClient = DioClient();

  Future<List<AllContentEntity>> getAllContent() async {
    final response = await makeGetRequest(
      _dioClient.dio.get(
        ApiConfig.getAllContent,

      ),
    );
    List<AllContentEntity> listAllContent = [];
    for(var item in response.data) {
      AllContentEntity user = AllContentEntity.fromJson(item);
      listAllContent.add(user);
    }
    return listAllContent;
  }
}