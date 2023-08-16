import 'package:get/get.dart';

import '../core/values/keys/end_point_key.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = EndPoint.API_URL;
    httpClient.timeout = EndPoint.API_TIMEOUT;
    super.onInit();
  }
}
