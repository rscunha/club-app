import 'package:b2c_app/service/auth/app_user.dart';
import 'package:b2c_app/service/auth/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:b2c_app/service/auth/auth_service_adapter.dart';

class SigninController extends StateNotifier<AsyncValue<void>> {
  SigninController({required this.authService}) : super(const AsyncData(null));

  final AuthService authService;

  Future<void> signin(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard<AppUser?>(
      () => authService.signIn(email, password),
    );
  }
}

final signinControllerProvider =
    StateNotifierProvider.autoDispose<SigninController, AsyncValue<void>>(
        (ref) {
  final adapter = ref.watch(authServiceAdapter);

  return SigninController(
    authService: adapter.create(),
  );
});
