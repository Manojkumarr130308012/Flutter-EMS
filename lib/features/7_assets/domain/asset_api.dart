import 'package:dio/dio.dart';
import 'package:oriens_eam/core/utils/dio_client.dart';
import 'package:oriens_eam/core/utils/enum/network_enums.dart';

class AssetApiService {
  final DioManager dioManager;

  AssetApiService({required this.dioManager});

  Future<dynamic> getAssets() async {
    Response response = await dioManager.dio.get(NetworkEnums.allAssets.path);
    return response;
  }

  Future<dynamic> getAssetsById(String assetId) async {
    print(NetworkEnums.assetById.path + assetId);
    Response response = await dioManager.dio.get(NetworkEnums.assetById.path + assetId);
    return response;
  }

  Future<dynamic> getSpecifyById(String assetId) async {
    print(NetworkEnums.specifyById.path + assetId);
    Response response = await dioManager.dio.get(NetworkEnums.specifyById.path + assetId);
    return response;
  }

  Future<dynamic> getAssetPartsById(String assetId) async {
    print(NetworkEnums.assetPartsById.path + assetId);
    Response response = await dioManager.dio.get(NetworkEnums.assetPartsById.path + assetId);
    return response;
  }
}
