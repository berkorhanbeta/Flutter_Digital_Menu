import 'package:get/get.dart';
import 'package:qr_menu/helper/api_client.dart';
import 'package:qr_menu/util/app_constants.dart';

class Repo {
  ApiClient apiClient;
  Repo({required this.apiClient});


  //Get Categories
  Future<Response> getAllCategories() async {
    Response response = await apiClient.getData(AppConstants.getAllCategories);
    return response;
  }

  //Get All Sub Categories
  Future<Response> getAllSubCategories(String id) async {
    Response response = await apiClient.getData(AppConstants.getSubCategory + id);
    return response;
  }



  //Get All Items
  Future<Response> getItemDetails(String id) async {
    Response response = await apiClient.getData(AppConstants.getItemDetails + id);
    return response;
  }

  //Get All Items
  Future<Response> getSubItemDetails(String id) async {
    Response response = await apiClient.getData(AppConstants.getSubItemDetails + id);
    return response;
  }
}