import 'package:b2c_app/features/_utils/async_value_ui.dart';
import 'package:b2c_app/features/welcome/presentation/controllers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends ConsumerWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(signinControllerProvider, (_, state) {
      state.showSnackbarOnError(context);
    });

    //final state = ref.watch(signinControllerProvider);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: Align(
                        child: Text('Olá, seja bem vindo!',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: size.height * 0.02)),
                      ),
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
