import 'package:get/get.dart';
import 'package:nova/features/chat/chat_controller.dart/chatController.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<ChatController>();
  }
}
