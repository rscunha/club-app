// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_id_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdToken _$IdTokenFromJson(Map<String, dynamic> json) {
  return IdToken(
    nickname: json['nickname'] as String,
    name: json['name'] as String,
    picture: json['picture'] as String,
    updateAt: json['update_at'] as String,
    iss: json['iss'] as String,
    sub: json['sub'] as String,
    aud: json['aud'] as String,
    email: json['email'] as String,
    iat: json['iat'] as int,
    exp: json['exp'] as int,
    authTime: json['auth_time'] as int,
  );
}

Map<String, dynamic> _$IdTokenToJson(IdToken instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'name': instance.name,
      'picture': instance.picture,
      'update_at': instance.updateAt,
      'iss': instance.iss,
      'sub': instance.sub,
      'aud': instance.aud,
      'email': instance.email,
      'iat': instance.iat,
      'exp': instance.exp,
      'auth_time': instance.authTime,
    };
