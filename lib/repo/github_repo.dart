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
        log(repo.body.toString());
        final GitHubUserName result =
            GitHubUserName.fromJson(jsonDecode(repo.body));
        log(result.toString());
        return result;
      } else {
        throw Exception("Failed to search");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
