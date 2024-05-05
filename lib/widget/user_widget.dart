import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/github_username_model.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, this.userName});

  final GitHubUserName? userName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[200],
              onBackgroundImageError: (obj, trace) {
                const Icon(Icons.person);
              },
              backgroundImage: NetworkImage(userName!.avatarUrl!),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userName!.name!),
                          Text(userName!.login!),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Text(userName!.createdAt!),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  userName!.bio != null
                      ? Text(userName!.bio!)
                      : const Text("This Profile has no bio"),
                  const SizedBox(
                    height: 12,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Repos'),
                              Text(userName!.publicRepos != null
                                  ? userName!.publicRepos!.toString()
                                  : "Not available"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Followers'),
                              Text(userName!.followers!.toString()),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Following'),
                              Text(userName!.following!.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/icon-location.svg"),
                          Text(userName!.location!),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icon-twitter.svg"),
                          Text(userName!.twitterUsername != null
                              ? userName!.twitterUsername!
                              : "Not available"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/icon-website.svg"),
                          Text(userName!.blog != null && userName!.blog! != ""
                              ? userName!.blog!
                              : "Not available"),
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icon-company.svg"),
                          Text(userName!.company != null
                              ? userName!.company!
                              : "Not available"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
