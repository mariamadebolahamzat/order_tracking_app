import 'package:equatable/equatable.dart';

class GitHubLoginRequest extends Equatable {
  String clientId;
  String clientSecret;
  String code;

  GitHubLoginRequest({required this.clientId, required this.clientSecret, required this.code});

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_secret": clientSecret,
        "code": code,
      };

  @override
  List<Object?> get props => [clientId, clientSecret, code];
}
