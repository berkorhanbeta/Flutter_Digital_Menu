
import 'package:get/get.dart';
import 'package:qr_menu/api/controller/controller.dart';
import 'package:qr_menu/api/repo/repo.dart';
import 'package:qr_menu/helper/api_client.dart';

Future init() async {

  Get.put(ApiClient());
  Get.put(Repo(apiClient: Get.find()));
  Get.put(Controller(repo: Get.find()));

}
