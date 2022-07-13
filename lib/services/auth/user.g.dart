// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    nickname: json['nickname'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    picture: json['picture'] as String,
    updateAt: json['update_at'] as String,
    sub: json['sub'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'name': instance.name,
      'picture': instance.picture,
      'update_at': instance.updateAt,
      'sub': instance.sub,
      'email': instance.email,
    };
