class GitHubUserName {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  String? hireable;
  String? bio;
  String? twitterUsername;
  int? publicRepos;
  int? publicGists;
  int? followers;
  int? following;
  String? createdAt;
  String? updatedAt;

  GitHubUserName(
      {login,
      id,
      nodeId,
      avatarUrl,
      gravatarId,
      url,
      htmlUrl,
      followersUrl,
      followingUrl,
      gistsUrl,
      starredUrl,
      subscriptionsUrl,
      organizationsUrl,
      reposUrl,
      eventsUrl,
      receivedEventsUrl,
      type,
      siteAdmin,
      name,
      company,
      blog,
      location,
      email,
      hireable,
      bio,
      twitterUsername,
      publicRepos,
      publicGists,
      followers,
      following,
      createdAt,
      updatedAt});

  GitHubUserName.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
    name = json['name'];
    company = json['company'];
    blog = json['blog'];
    location = json['location'];
    email = json['email'];
    hireable = json['hireable'];
    bio = json['bio'];
    twitterUsername = json['twitter_username'];
    publicRepos = json['public_repos'];
    publicGists = json['public_gists'];
    followers = json['followers'];
    following = json['following'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login ?? "";
    data['id'] = id ?? "";
    data['node_id'] = nodeId ?? "";
    data['avatar_url'] = avatarUrl ?? "";
    data['gravatar_id'] = gravatarId ?? "";
    data['url'] = url ?? "";
    data['html_url'] = htmlUrl ?? "";
    data['followers_url'] = followersUrl ?? "";
    data['following_url'] = followingUrl ?? "";
    data['gists_url'] = gistsUrl ?? "";
    data['starred_url'] = starredUrl ?? "";
    data['subscriptions_url'] = subscriptionsUrl ?? "";
    data['organizations_url'] = organizationsUrl ?? "";
    data['repos_url'] = reposUrl ?? "";
    data['events_url'] = eventsUrl ?? "";
    data['received_events_url'] = receivedEventsUrl ?? "";
    data['type'] = type ?? "";
    data['site_admin'] = siteAdmin ?? "";
    data['name'] = name ?? "";
    data['company'] = company ?? "";
    data['blog'] = blog ?? "";
    data['location'] = location ?? "";
    data['email'] = email ?? "";
    data['hireable'] = hireable ?? "";
    data['bio'] = bio ?? "";
    data['twitter_username'] = twitterUsername ?? "";
    data['public_repos'] = publicRepos ?? "";
    data['public_gists'] = publicGists ?? "";
    data['followers'] = followers ?? "";
    data['following'] = following ?? "";
    data['created_at'] = createdAt ?? "";
    data['updated_at'] = updatedAt ?? "";
    return data;
  }
}
