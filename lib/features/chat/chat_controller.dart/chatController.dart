import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:nova/services/ApiService.dart';

class ChatController extends GetxController {
  RxString AiResponse = ''.obs;
  RxBool isloading = false.obs;

  final inputcontroller = TextEditingController();
  final FlutterTts tts = FlutterTts();

  @override
  Future<void> onInit() async {
    super.onInit();

    if (!kIsWeb) {
      tts.setLanguage("en-GB");
      tts.setSpeechRate(0.8);
      tts.setVolume(1.0);
      tts.setPitch(1.1);
      await tts.setVoice({
        "name": "en-gb-x-gbb#female_1-local",
        "locale": "en-GB",
      });

      tts.setStartHandler(() {
        if (kDebugMode) print("TTS started");
      });

      tts.setCompletionHandler(() {
        if (kDebugMode) print("TTS completed");
      });

      tts.setErrorHandler((msg) {
        if (kDebugMode) print("TTS error: $msg");
      });
    }
  }

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

  void textToSpeach() async {
    final text = AiResponse.value;

    if (text.isEmpty) {
      Get.snackbar(
        'Error',
        'Unable to read text',
        backgroundColor: const Color(0xff000000),
        colorText: const Color(0xffffffff),
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      if (kIsWeb) {
        // 🌐 Web TTS using browser API
        // final utterance = html.SpeechSynthesisUtterance(text);
        // html.window.speechSynthesis?.cancel(); // stop previous
        // html.window.speechSynthesis?.speak(utterance);

        if (kDebugMode) print("Web TTS triggered");
      } else {
        // 📱 Android / iOS
        await tts.stop(); // prevent overlap
        await tts.speak(text);

        if (kDebugMode) print("Mobile TTS triggered");
      }
    } catch (e) {
      if (kDebugMode) print("TTS ERROR: $e");

      Get.snackbar(
        'TTS Error',
        'Failed to play speech',
        backgroundColor: const Color(0xff000000),
        colorText: const Color(0xffffffff),
        duration: Duration(milliseconds: 200),
      );
    }
  }
}
