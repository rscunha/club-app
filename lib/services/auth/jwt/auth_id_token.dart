import 'package:json_annotation/json_annotation.dart';
part 'auth_id_token.g.dart';

@JsonSerializable()
class IdToken {
  final String nickname;
  final String name;
  final String picture;

  @JsonKey(name: 'update_at')
  final String updateAt;
  final String iss;
  final String sub;
  final String aud;
  final String email;
  final int iat;
  final int exp;

  @JsonKey(name: 'auth_time')
  final int authTime;

  IdToken(
      {required this.nickname,
      required this.name,
      required this.picture,
      required this.updateAt,
      required this.iss,
      required this.sub,
      required this.aud,
      required this.email,
      required this.iat,
      required this.exp,
      required this.authTime});

  String get userId => sub;

  factory IdToken.fromJson(Map<String, dynamic> json) =>
      _$IdTokenFromJson(json);

  Map<String, dynamic> toJson() => _$IdTokenToJson(this);
}
