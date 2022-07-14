import 'dart:convert';

import 'package:b2c_app/services/auth/jwt/auth_id_token.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

class AuthTokenService {
  static AuthorizationTokenRequest generateDiscoveryEndPoint(
      String clientId, String redirectUrl, String issuer) {
    return AuthorizationTokenRequest(clientId, redirectUrl,
        issuer: issuer,
        scopes: ['openid', 'profile', 'óffline_access', 'email']);
  }

  static IdToken parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    final Map<String, dynamic> json = jsonDecode(
      utf8.decode(
        base64Url.decode(base64Url.normalize(parts[1])),
      ),
    );

    return IdToken.fromJson(json);
  }
}
