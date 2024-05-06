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
    final repo = await githubRepo.getUserData(event.userName!);
    if (repo.login != null) {
      emit(GithubSuccessState(repo));
    } else {
      emit(GithubErrorState("Not Found"));
    }
  }
}
