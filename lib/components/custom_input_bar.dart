import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nova/features/chat/chat_controller.dart/chatController.dart';

class CustomInputBar extends GetWidget<ChatController> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.inputcontroller,
      keyboardAppearance: Brightness.dark,
      textInputAction: TextInputAction.send,
      decoration: InputDecoration(
        hintText: 'Enter your text',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }
}
