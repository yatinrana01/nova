import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:nova/features/chat/binding/chat_binding.dart';
import 'package:nova/features/chat/view/chatscreen.dart';
import 'custom_routes.dart';

class CustomPages {
  static final List<GetPage> pages = [
    GetPage(
      name: CustomRoutes.chat,
      page: () => ChatScreen(),
      binding: ChatBinding(),
    ),
  ];
}