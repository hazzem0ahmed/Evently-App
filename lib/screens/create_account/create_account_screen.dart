import 'package:evently/core/app_assets.dart';
import 'package:evently/core/utils/validation.dart';
import 'package:evently/firebase/firebase_auth.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/widgets/language_switch.dart';
import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String routeName = "/CreateAccountScreen";

  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  ValueNotifier<bool> rePasswordVisible = ValueNotifier(true);
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.register,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.asset(
              AppAssets.appLogo,
              width: size.width * 0.3,
              height: size.height * 0.2,
            ),
            SizedBox(height: size.height * 0.03),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        (value) => ValidationCheck.validateUserName(
                          value ?? "",
                          locale,
                        ),

                    decoration: InputDecoration(
                      hintText: locale.name,
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        (value) =>
                            ValidationCheck.validateEmail(value ?? "", locale),
                    decoration: InputDecoration(
                      hintText: locale.email,
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  ValueListenableBuilder(
                    valueListenable: passwordVisible,
                    builder:
                        (context, value, child) => TextFormField(
                          controller: passwordController,
                          obscureText: passwordVisible.value,
                          obscuringCharacter: "*",
                          keyboardType: TextInputType.visiblePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:
                              (value) => ValidationCheck.validatePassWord(
                                value ?? "",
                                locale,
                              ),
                          decoration: InputDecoration(
                            hintText: locale.passWord,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                passwordVisible.value = !value;
                              },
                              child: Icon(
                                value ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  ValueListenableBuilder(
                    valueListenable: rePasswordVisible,
                    builder:
                        (context, value, child) => TextFormField(
                          controller: rePasswordController,
                          obscureText: rePasswordVisible.value,
                          obscuringCharacter: "*",
                          keyboardType: TextInputType.visiblePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:
                              (value) => ValidationCheck.validateRePassword(
                                value ?? "",
                                passwordController.text,
                                locale,
                              ),
                          decoration: InputDecoration(
                            hintText: locale.rePassword,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                rePasswordVisible.value = !value;
                              },
                              child: Icon(
                                value ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            ValueListenableBuilder(
              valueListenable: isLoading,
              builder:
                  (context, value, child) => FilledButton(
                    onPressed: () async {
                      _createAccount();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        value
                            ? CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.surface,
                            )
                            : Text(locale.createAccount),
                      ],
                    ),
                  ),
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(locale.alreadyHaveAccount),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginScreen.routeName,
                    );
                  },
                  child: Text(locale.login),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Align(alignment: Alignment.center, child: LanguageSwitch()),
          ],
        ),
      ),
    );
  }

  Future<void> _createAccount() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        await FirebaseAuthServices().registerUser(
          nameController.text,
          emailController.text,
          passwordController.text,
        );
        if (!mounted) return;
        Navigator.pop(context);
      } catch (error) {
        debugPrint(error.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }
}
