
import '../api_provider.dart';

abstract class DashboardRepo {

  Future<dynamic> dashboard();
}

class RealDashboardRepo extends DashboardRepo {
  ApiProvider _apiProvider = ApiProvider();

  @override
  Future<dynamic> dashboard() {
    return _apiProvider.processDashboard();
  }


}

class FakeDashboardRepo extends DashboardRepo {

  @override
  Future dashboard() {
    // TODO: implement businessAspects
    throw UnimplementedError();
  }


}
