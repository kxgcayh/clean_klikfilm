import 'package:dio/src/cancel_token.dart';
import 'package:get/get.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class ThirdPartyProvider extends GetConnect implements ThirdPartyRepositoryInterface {
  @override
  Future<DeviceNetworkModel?> networkDetail({CancelToken? cancel}) async {
    final Response<dynamic> response = await get('https://pro.ip-api.com/json?key=aSNRsF4biutfGzA');
    return DeviceNetworkModel.fromJson(response.body);
  }
}
