import 'package:get/get.dart';
import 'package:nova/features/chat/chat_controller.dart/chatController.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatController());
  }
}
