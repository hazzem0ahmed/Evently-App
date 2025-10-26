import 'package:evently/core/app_assets.dart';
import 'package:evently/firebase/firebase_auth.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:evently/screens/create_account/create_account_screen.dart';
import 'package:evently/screens/forgot_password.dart';
import 'package:evently/screens/home_screen/home_screen.dart';
import 'package:evently/widgets/language_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../core/utils/validation.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Image.asset(
              AppAssets.appLogo,
              width: size.width * 0.3,
              height: size.height * 0.3,
              alignment: Alignment.center,
            ),
            SizedBox(height: size.height * 0.02),
            Form(
              key: formKey,
              child: Column(
                children: [
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
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: Text(locale.forgotPassword),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            ValueListenableBuilder(
              valueListenable: isLoading,
              builder:
                  (context, value, child) => FilledButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading.value = false;
                        try {
                          await FirebaseAuthServices().signIn(
                            emailController.text,
                            passwordController.text,
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            HomeScreen.routeName,
                          );
                        } catch (error) {
                          debugPrint(error.toString());
                        } finally {
                          isLoading.value = false;
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        value
                            ? CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.surface,
                            )
                            : Text(locale.login),
                      ],
                    ),
                  ),
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                Text(locale.dontHaveAccount),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CreateAccountScreen.routeName);
                  },
                  child: Text(locale.createAccount),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              spacing: 5,
              children: [
                Expanded(child: Divider(indent: 40, thickness: 2)),
                Text(locale.or, style: Theme.of(context).textTheme.titleLarge),
                Expanded(child: Divider(endIndent: 40, thickness: 2)),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            OutlinedButton(
              onPressed: () async {
                try {
                  final user = await FirebaseAuthServices().googleSignIn();
                  if (user != null && mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                } on FirebaseAuthException catch (error) {
                  debugPrint(error.message);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.message ?? locale.somethingWentWrong),
                    ),
                  );
                } catch (error) {
                  debugPrint(error.toString());
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(error.toString())));
                }
              },
              child: Row(
                spacing: 9,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.googleLogo, height: size.height * 0.03),
                  Text(locale.loginWithGoogle),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Align(alignment: Alignment.center, child: LanguageSwitch()),
          ],
        ),
      ),
    );
  }
}

