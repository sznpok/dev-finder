import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/github_username_model.dart';

class GithubRepo {
  Future<GitHubUserName> getUserData(String user) async {
    final repo = await http.get(
      Uri.parse("https://api.github.com/users/$user"),
    );
    try {
      if (repo.statusCode == 200) {
        final GitHubUserName result =
            GitHubUserName.fromJson(jsonDecode(repo.body));
        return result;
      } else if (repo.statusCode == 404) {
        throw NotFoundException("User not found");
      } else {
        throw Exception("Unexpected error occurred");
      }
    } catch (e) {
      throw Exception(repo.body.toString());
    }
  }
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException(this.message);
}
