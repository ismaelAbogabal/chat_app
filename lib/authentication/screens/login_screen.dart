import 'package:auth_buttons/auth_buttons.dart';
import 'package:chat_app/authentication/screens/phone_screen.dart';
import 'package:chat_app/authentication/screens/singup_screen.dart';
import 'package:chat_app/common/utils/app_router.dart';
import 'package:chat_app/common/widgets/horizontal_line_widget.dart';
import 'package:chat_app/common/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool loading = false;

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
                "Welcome",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "Chat app",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height: 12),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              const SizedBox(height: 12),
              LoadingButton(
                isLoading: loading,
                onPressed: () {
                  setState(() => loading = true);

                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() => loading = false);
                  });
                },
                label: "LOGIN",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        appRouter.push(SignUpScreen());
                      },
                      child: const Text("Join now"))
                ],
              ),
              const HorizontalLineWidget(
                label: "OR",
                height: 40,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        appRouter.push(PhoneScreen());
                      },
                      icon: const Icon(Icons.phone)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.google),
                  ),
                ],
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
