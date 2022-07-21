import 'package:b2c_app/features/home.dart';
import 'package:b2c_app/features/welcome.dart';
import 'package:b2c_app/service/auth/auth_service_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthEntryPoint extends ConsumerWidget {
  const AuthEntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);

    return authState.maybeWhen(
        data: (user) => null != user ? const Home() : const Welcome(),
        orElse: () => Scaffold(
              appBar: AppBar(),
              body: const Center(child: CircularProgressIndicator()),
            ));
  }
}
