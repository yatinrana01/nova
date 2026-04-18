import 'package:get/get.dart';
import 'package:nova/services/ApiService.dart';
import 'package:nova/utils/constant.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    getData('Hello');
    super.onInit();
  }

  RxString AiResponse = ''.obs;
  RxBool isloading = false.obs;

  Future<dynamic> getData(String prompt) async {
    try {
      isloading.value = true;
      final response = await ApiService().postApiData(prompt);
      if (response != null) {
        AiResponse.value = response;
      } else {
        AiResponse.value = 'No response from AI';
      }
    } catch (e) {
      AiResponse.value = 'Error ${e.toString()}';
    } finally {
      isloading.value = false;
    }

    print('Ai reponse:  ${AiResponse.value}');
  }
}
