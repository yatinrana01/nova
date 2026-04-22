import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nova/features/chat/chat_controller.dart/chatController.dart';

class CustomSendButton extends GetWidget<ChatController> {
  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        controller.inputcontroller.text.isEmpty
            ? Get.snackbar('message is empty', 'please write a prompt first')
            : controller.getData(controller.inputcontroller.text);
      },
      icon: Icon(Icons.send),
    );
  }
}
