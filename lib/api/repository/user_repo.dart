
import 'package:optimal_oncology/api/responses/login/login_response.dart';
import '../api_provider.dart';

abstract class UserRepo {
  Future<LoginRegisterResponse> login(String email,String password);
}

class RealUserRepo extends UserRepo {
  ApiProvider _apiProvider = ApiProvider();

  @override
  Future<LoginRegisterResponse> login( email,password) {
    return _apiProvider.processLogin(email,password);
  }
}
class FakeUserRepo extends UserRepo {
  @override
  Future<LoginRegisterResponse> login(email,password) {
    // TODO: implement login
    throw UnimplementedError();
  }


}
