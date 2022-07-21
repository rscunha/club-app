import 'package:b2c_app/service/auth/app_user.dart';
import 'package:b2c_app/service/auth/provders/firebase/firebase_auth_service.dart';
import 'package:b2c_app/service/auth/provders/providers.default.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_service.dart';

enum AuthServiceType { firebase, other }

class AuthServiceAdapter {
  AuthServiceAdapter(this.type);

  final AuthServiceType type;

  AuthService? create() {
    AuthService? authService;

    if (type == AuthServiceType.firebase) {
      authService = FirebaseAuthService();
    }

    return authService;
  }
}

final authServiceAdapter = Provider<AuthServiceAdapter>((ref) {
  const defaultProvider = String.fromEnvironment('DEFAULT_PROVIDER',
      defaultValue: Providers.defaultProvider);

  return AuthServiceAdapter(AuthServiceType.values.byName(defaultProvider));
});

final authStateChangeProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final adapter = ref.watch(authServiceAdapter);
  return adapter.create()!.onAuthStateChanged;
});
