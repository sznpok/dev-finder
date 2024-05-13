import 'package:dev_finder/constants/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../model/github_username_model.dart';

class UserWidget extends StatelessWidget {
  UserWidget({super.key, this.userName});

  final GitHubUserName? userName;

  final dateFormat = DateFormat('MMM dd, yyyy');

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(userName!.createdAt.toString());
    final date = dateFormat.format(dateTime);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  onBackgroundImageError: (obj, trace) {
                    const Icon(Icons.person);
                  },
                  backgroundImage:
                      NetworkImage(userName!.avatarUrl!.toString()),
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userName!.name != null
                                    ? userName!.name!
                                    : "No Name"),
                                Text(userName!.login!),
                              ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(date),
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
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Repos'),
                                  Text(
                                    userName!.publicRepos != null
                                        ? userName!.publicRepos!.toString()
                                        : "Not available",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Followers'),
                                  Text(
                                    userName!.followers!.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Following'),
                                  Text(
                                    userName!.following!.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/icon-twitter.svg"),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      userName!.twitterUsername != null
                          ? userName!.twitterUsername!
                          : "Not available",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icon-location.svg",
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      userName!.location != null
                          ? userName!.location!
                          : " No Address Found",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icon-website.svg",
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      userName!.blog != null && userName!.blog! != ""
                          ? userName!.blog!
                          : "Not available",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 4,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icon-company.svg"),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      userName!.company != null
                          ? userName!.company!
                          : "Not available",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
