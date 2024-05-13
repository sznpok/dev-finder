import 'package:dev_finder/bloc/github_bloc/github_bloc.dart';
import 'package:dev_finder/bloc/visibility_bloc/visibility_bloc.dart';
import 'package:dev_finder/bloc/visibility_bloc/visibility_state.dart';
import 'package:dev_finder/model/github_username_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/visibility_bloc/visibility_event.dart';
import '../constants/color_constant.dart';
import '../widget/user_widget.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dev Finder"),
        actions: [
          BlocBuilder<VisibilityBloc, VisibilityState>(
            builder: (context, state) {
              bool visible = (state as VisibilityToggled).visible;
              return IconButton(
                onPressed: () {
                  BlocProvider.of<VisibilityBloc>(context)
                      .add(ToggleVisibilityEvent());
                },
                icon: Icon(
                  !visible ? Icons.light_mode : Icons.dark_mode,
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            DecoratedBox(
              decoration: Theme.of(context).brightness == Brightness.light
                  ? const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    )
                  : const BoxDecoration(),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search GitHub username...",
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.all(16.0),
                  suffixIcon: TextButton(
                    onPressed: () {
                      if (searchController.text.isNotEmpty) {
                        BlocProvider.of<GithubBloc>(context).add(
                          SearchGithubEvent(searchController.text),
                        );
                      } else {
                        return;
                      }
                    },
                    child: Text(
                      "Search",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: secondaryLightColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            BlocBuilder<GithubBloc, GithubState>(
              builder: (context, state) {
                if (state is GithubLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is GithubErrorState) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else if (state is GithubSuccessState) {
                  return UserWidget(userName: state.gitHubUserName!);
                }
                return const Expanded(
                  child: Center(
                    child: Text("👆️Search the Github account ☝"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
