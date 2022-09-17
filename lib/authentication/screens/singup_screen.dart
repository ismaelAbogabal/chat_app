import 'package:chat_app/authentication/controller/auth_controller.dart';
import 'package:chat_app/authentication/screens/phone_screen.dart';
import 'package:chat_app/common/utils/app_router.dart';
import 'package:chat_app/common/widgets/horizontal_line_widget.dart';
import 'package:chat_app/common/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_validator/form_validator.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignUpScreen> {
  bool loading = false;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
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
                  "Sign up",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 10),
                Text("Join now its free. And will be free for ever",
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  validator:
                      ValidationBuilder().minLength(4).required().build(),
                  decoration: InputDecoration(labelText: "Name"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  validator: ValidationBuilder().email().build(),
                  decoration: InputDecoration(labelText: "Email"),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  validator: ValidationBuilder().minLength(6).build(),
                  decoration: InputDecoration(labelText: "Password"),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  obscureText: true,
                  controller: rePasswordController,
                  validator: (String? value) {
                    if (value != passwordController.text)
                      return "Passwords don't match";
                  },
                  decoration:
                      InputDecoration(labelText: "Re enter you password"),
                ),
                const SizedBox(height: 12),
                LoadingButton(
                  isLoading: loading,
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;
                    
                    setState(() => loading = true);

                    final controller = ref.read(authControllerRef);
                    controller
                        .singUp(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        )
                        .then((value) => setState(() => loading = false));
                  },
                  label: "SIGN UP",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? Bact to"),
                    TextButton(
                      onPressed: () => appRouter.pop(),
                      child: const Text("Login"),
                    ),
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
      ),
    );
  }
}
