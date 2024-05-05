import 'package:dev_finder/bloc/visibility_bloc/visibility_bloc.dart';
import 'package:dev_finder/bloc/visibility_bloc/visibility_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/visibility_bloc/visibility_event.dart';
import '../constants/color_constant.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
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
                decoration: InputDecoration(
                  hintText: "Search GitHub username...",
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.all(16.0),
                  suffixIcon: TextButton(
                    onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
