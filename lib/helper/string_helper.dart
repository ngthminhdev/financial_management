import 'dart:convert';

class StringHelper {
    static tryParseJson(json) {
    try {
      dynamic result = jsonDecode(json);
      return result;
    } catch (e) {
      return json;
    }
  }
}
