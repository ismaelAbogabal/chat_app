import 'package:auth_buttons/auth_buttons.dart';
import 'package:chat_app/authentication/screens/singup_screen.dart';
import 'package:chat_app/common/utils/app_router.dart';
import 'package:chat_app/common/widgets/horizontal_line_widget.dart';
import 'package:chat_app/common/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

class PhoneScreen extends ConsumerStatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PhoneScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<PhoneScreen> {
  bool loading = false;

  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpeg'),
                colorFilter: ColorFilter.mode(
                  Colors.black87,
                  BlendMode.multiply,
                )),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/logo.png',
                width: 120,
                height: 120,
              ),
              Text(
                "Phone number",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter your phone number and we will \n handle everything',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              IntlPhoneField(enabled: !codeSent),
              const SizedBox(height: 12),
              const Pinput(
                length: 4,
                // focusedPinTheme: PinTheme(
                //     height: 50,
                //     decoration: BoxDecoration(
                //       border: Border(
                //         bottom: BorderSide(
                //           color: Theme.of(context).primaryColor,
                //           width: 3,
                //         ),
                //       ),
                //     )),
                defaultPinTheme: PinTheme(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              LoadingButton(
                isLoading: loading,
                onPressed: () {
                  setState(() => loading = true);

                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() => loading = false);
                  });
                },
                label: "SEND OTP",
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
