import 'package:dio/dio.dart';
import 'package:nova/utils/constant.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {"Content-Type": "application/json"},
      validateStatus: (status) => true, // important for debugging
    ),
  );

  Future<String?> postApiData(String query) async {
    try {
      final response = await _dio.post(
        Constant.base_url,
        data: {
          "contents": [
            {
              "parts": [
                {"text": query}
              ]
            }
          ]
        },
      );

      /// 🔍 DEBUG LOGS
      print("STATUS: ${response.statusCode}");
      print("FULL RESPONSE: ${response.data}");

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['candidates'] != null &&
            data['candidates'].isNotEmpty) {
          return data['candidates'][0]['content']['parts'][0]['text'];
        } else {
          print("No candidates found");
        }
      } else {
        print("HTTP ERROR: ${response.statusCode}");
      }
    } catch (e) {
      if (e is DioException) {
        print("Dio Error: ${e.response?.data}");
      } else {
        print("Error: $e");
      }
    }
    return null;
  }
}