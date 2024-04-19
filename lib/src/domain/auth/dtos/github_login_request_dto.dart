import 'package:equatable/equatable.dart';

class GitHubLoginRequest extends Equatable {
  final String clientId;
  final String clientSecret;
  final String code;

  const GitHubLoginRequest(
      {required this.clientId, required this.clientSecret, required this.code});

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_secret": clientSecret,
        "code": code,
      };

  @override
  List<Object?> get props => [clientId, clientSecret, code];
}
