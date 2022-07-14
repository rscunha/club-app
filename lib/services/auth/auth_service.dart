import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:b2c_app/config/auth.dart';
import 'package:b2c_app/services/auth/jwt/auth_id_token.dart';
import 'package:b2c_app/services/auth/user.dart';
import 'package:b2c_app/services/auth/jwt/auth_token_service.dart';

class AuthService {
  static final AuthService instance = AuthService._singleton();

  factory AuthService() => instance;
  AuthService._singleton();

  final FlutterAppAuth appAuth = FlutterAppAuth();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  User? profile;
  IdToken? idToken;
  String? accessToken;

  Future login() async {
    final request = AuthTokenService.generateDiscoveryEndPoint(
        AUTH_CLIENTE_ID, AUTH_REDIRECT_URI, AUTH_ISSUER);

    final AuthorizationTokenResponse? response =
        await appAuth.authorizeAndExchangeCode((request));

    _configure(response);
  }

  Future<User> getUserBy(String accessToken) async {
    final url = Uri.https(AUTH_DOMAIN, '/userinfo');
    final response =
        await http.get(url, headers: {'Authentication': 'Bearer $accessToken'});

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao recuperar os dados do usuários');
    }
  }

  Future init() async {
    final storageRefreshToken =
        await secureStorage.read(key: REFRESH_TOKEN_KEY);

    if (null == storageRefreshToken) {
      throw Exception(
          'Refresh Token não encontrado. Feche o aplicativo e tente faça o login novamente');
    }

    final TokenResponse? response = await appAuth.token(
      TokenRequest(AUTH_CLIENTE_ID, AUTH_REDIRECT_URI,
          issuer: AUTH_ISSUER, refreshToken: storageRefreshToken),
    );

    await _configure(response);
  }

  Future _configure(response) async {
    if (!_isValid(response)) {
      throw Exception(
          'Ocorreu um erro ao tentar autenticar o usuário. Não foi possível validar o token de acesso.');
    }

    await _setLocalVariable(response);

    if (null != response.refreshToken) {
      await secureStorage.write(
          key: REFRESH_TOKEN_KEY, value: response.refreshToken);
    }
  }

  Future _setLocalVariable(response) async {
    profile = await getUserBy(response.accessToken!);
    idToken = AuthTokenService.parseIdToken(response.idToken!);
    accessToken = response.accessToken;
  }

  bool _isValid(response) {
    return null != response &&
        null != response.accessToken &&
        null != response.idToken;
  }
}
