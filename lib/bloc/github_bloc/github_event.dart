part of 'github_bloc.dart';

@immutable
sealed class GithubEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchGithubEvent extends GithubEvent {
  final String? userName;

  SearchGithubEvent(this.userName);

  @override
  // TODO: implement props
  List<Object?> get props => [userName];
}
