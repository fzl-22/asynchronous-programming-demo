import 'dart:convert';

import 'package:asynchronous_programming/core/constants/constant.dart';
import 'package:asynchronous_programming/core/exceptions/exception.dart';
import 'package:asynchronous_programming/src/models/user_model.dart';
import 'package:http/http.dart' as http;

const kGetUsers = "/users";

class UserRemoteService {
  static final http.Client _client = http.Client();

  static Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _client.get(
        Uri.parse("$kBaseUrl$kGetUsers"),
      );

      if (response.statusCode != 200) {
        throw APIException(
          message: "Failed to fetch users. Status Code: ${response.statusCode}",
        );
      }

      final List<dynamic> jsonResponse = jsonDecode(response.body);

      List<UserModel> users = jsonResponse.map((userMap) {
        return UserModel.fromMap(userMap);
      }).toList();

      return users;
    } on http.ClientException catch (e) {
      throw APIException(
        message: e.message,
      );
    } catch (e) {
      throw APIException(
        message: "An unknown error occurred",
      );
    }
  }
}
