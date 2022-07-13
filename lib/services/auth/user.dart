import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String nickname;
  final String name;
  final String picture;

  @JsonKey(name: 'update_at')
  final String updateAt;
  final String sub;
  final String email;
  String get id => sub;

  User(
      {required this.nickname,
      required this.name,
      required this.email,
      required this.picture,
      required this.updateAt,
      required this.sub});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
