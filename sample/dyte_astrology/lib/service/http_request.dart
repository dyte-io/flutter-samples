import 'dart:convert';

import 'package:get/route_manager.dart';
import 'package:http/http.dart';

class HttpRequest {
  // organization ID
  static const String _orgId = "-----ORG ID-----";
  // API Key
  static const String _apiKey = "-----API KEY-----";
  //Format of token-> Basic base64.encode(utf8.encode(<ORG_ID>:<API_KEY>))
  static final String _token =
      "Basic ${base64.encode(utf8.encode('$_orgId:$_apiKey'))}";
  static const String _baseUrl = "https://api.dyte.io/v2";

  // Room Creation
  static Future<String?> createMeeting() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      Response response = await post(Uri.parse("$_baseUrl/meetings"),
          headers: {
            'Authorization': _token,
            "Content-Type": "application/json"
          },
          body: json.encode({"title": "astro-$id"}));
      if (response.statusCode == 201) {
        Map map = jsonDecode(response.body);
        return map["data"]["id"];
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return null;
  }

// Add Participant in room
  static Future<String?> addParticipant(String name, String roomId) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      Response response = await post(
          Uri.parse("$_baseUrl/meetings/$roomId/participants"),
          headers: {
            'Authorization': _token,
            "Content-Type": "application/json"
          },
          body: json.encode({
            "name": name,
            "preset_name": "group_call_participant",
            "custom_participant_id": "player-$id"
          }));
      if (response.statusCode == 201) {
        Map map = jsonDecode(response.body);
        return map["data"]["token"];
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return null;
  }
}
