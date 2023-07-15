import 'package:club_app/features/_utils/async_value_ui.dart';
import 'package:club_app/features/welcome/presentation/controllers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phone_form_field/phone_form_field.dart';

class Signin extends ConsumerWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(signinControllerProvider,
        (_, state) => state.showSnackbarOnError(context));

    final state = ref.watch(signinControllerProvider);

    return Scaffold(
      body: buildSigninDesign(context),
    );
  }

  Widget _buildPhoneSignin() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: buildTextField()),
          ],
        )
      ],
    );
  }

  Widget buildTextField() {
    return Center(
        child: SizedBox(
            width: 350,
            height: 40,
            child: PhoneFormField(
              key: const Key("phone_number"),
              defaultCountry: IsoCode.BR,
              decoration: const InputDecoration(
                fillColor: Color.fromARGB(255, 231, 228, 228),
                filled: true,
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              validator: PhoneValidator.validMobile(),
            )

            /*TextFormField(
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            fillColor: Color.fromARGB(255, 231, 228, 228),
            filled: true,
            labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          style: const TextStyle(fontSize: 20),
        )*/
            ));
  }

  Widget buildSigninDesign(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 32.0,
            ),
            _buildPhoneSignin(),
          ],
        ),
      ),
    );
  }
}
