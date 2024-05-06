part of 'github_bloc.dart';

@immutable
sealed class GithubState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class GithubInitial extends GithubState {}

final class GithubSuccessState extends GithubState {
  final GitHubUserName? gitHubUserName;

  GithubSuccessState(this.gitHubUserName);

  @override
  // TODO: implement props
  List<Object?> get props => [gitHubUserName];
}

final class GithubErrorState extends GithubState {
  final String? error;

  GithubErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

final class GithubLoadingState extends GithubState {}
