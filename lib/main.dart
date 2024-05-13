import 'package:dev_finder/bloc/visibility_bloc/visibility_bloc.dart';
import 'package:dev_finder/bloc/visibility_bloc/visibility_state.dart';
import 'package:dev_finder/ui/app_screen.dart';
import 'package:dev_finder/ui/splash_screen.dart';
import 'package:dev_finder/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/github_bloc/github_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VisibilityBloc(),
        ),
        BlocProvider(
          create: (context) => GithubBloc(),
        ),
      ],
      child: BlocBuilder<VisibilityBloc, VisibilityState>(
        builder: (context, state) {
          bool visible = (state as VisibilityToggled).visible;
          return MaterialApp(
            title: 'Dev Finder',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: visible ? lightThemeData(context) : darkThemeData(context),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
