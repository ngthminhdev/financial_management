import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/model/user_model.dart';
import 'package:financial_management/services/http_service.dart';

class AuthService {
  String endpoint = 'auth';
  late HttpService http;

  AuthService() {
    http = HttpService();
    http.withHost(appConstant.apiHost);
    http.withPath(endpoint);
  }

  Future<Response> register(Map<String, dynamic> body) async {
    http.withPath('register');
    http.makePost();
    http.withBody(body);
    Response response = await http.execute();
    return response;
  }

  Future<User> login(Map<String, dynamic> body) async {
    http.withPath('login');
    http.makePost();
    http.withBody(body);
    Response response = await http.execute();
    final user = User.fromJson(response.data);
    return user;
  }
}
