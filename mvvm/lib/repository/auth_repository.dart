import 'package:mvvm/data/network/NetworkApiSevices.dart';

import '../data/network/BaseApiServices.dart';
import '../res/components/app_url.dart';

class AuthRepository {
  NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      final response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> SignUpApi(dynamic data) async {
    try {
      final response =
          await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
