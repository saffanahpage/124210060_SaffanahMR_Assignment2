import 'package:tujuh/base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadUsers() {
    return BaseNetwork.get("users");
  }

  Future<Map<String, dynamic>> loadDetailUsers(int idget) {
    String id = idget.toString();
    return BaseNetwork.get("users/$id");
  }
}
