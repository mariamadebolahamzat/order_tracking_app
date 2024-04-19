import 'package:equatable/equatable.dart';

class GitHubLoginResponse extends Equatable {
  final String accessToken;
  final String tokenType;
  final String scope;

  const GitHubLoginResponse(
      {required this.accessToken, required this.tokenType, required this.scope});

  factory GitHubLoginResponse.fromJson(Map<String, dynamic> json) => GitHubLoginResponse(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        scope: json["scope"],
      );

  @override
  List<Object?> get props => [accessToken, tokenType, scope];
}
