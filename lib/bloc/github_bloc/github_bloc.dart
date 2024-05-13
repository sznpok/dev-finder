import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/github_username_model.dart';
import '../../repo/github_repo.dart';

part 'github_event.dart';

part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  GithubBloc() : super(GithubInitial()) {
    on<SearchGithubEvent>(searchGithubEvent);
  }

  FutureOr<void> searchGithubEvent(
      SearchGithubEvent event, Emitter<GithubState> emit) async {
    GithubRepo githubRepo = GithubRepo();
    emit(GithubLoadingState());

    try {
      final repo = await githubRepo.getUserData(event.userName!);
      emit(GithubSuccessState(repo));
    } catch (e) {
      if (e is NotFoundException) {
        emit(GithubErrorState("User not found"));
      } else {
        emit(GithubErrorState("Failed to fetch user data"));
      }
    }
  }
}
