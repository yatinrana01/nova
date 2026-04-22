import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nova/services/ApiService.dart';
import 'package:nova/utils/constant.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  RxString AiResponse = ''.obs;
  RxBool isloading = false.obs;

  final inputcontroller = TextEditingController();

  Future<dynamic> getData(String prompt) async {
    try {
      isloading.value = true;
      final response = await ApiService().GetData(prompt);
      if (response != null) {
        AiResponse.value = response;
      } else {
        AiResponse.value = 'No response from AI';
      }
    } catch (e) {
      // AiResponse.value = 'Error ${e.toString()}';
      AiResponse.value = 'No response from AI';
    } finally {
      isloading.value = false;
    }

  }
}
