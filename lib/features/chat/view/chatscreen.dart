import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova/components/custom_send_button.dart';
import 'package:nova/features/chat/chat_controller.dart/chatController.dart';
import 'package:nova/components/custom_input_bar.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'N O V A',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Color(0xff000000),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Obx(() {
                    if (controller.isloading.value) {
                      return Center(
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      );
                    }
                    if (controller.AiResponse.value.isEmpty) {
                      return Text('No response from Ai');
                    } else {
                      return SingleChildScrollView(
                        child: Text(controller.AiResponse.value),
                      );
                    }
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: CustomInputBar()),
                    SizedBox(width: 10),
                    CustomSendButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
