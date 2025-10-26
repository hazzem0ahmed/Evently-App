import 'package:evently/core/app_assets.dart';
import 'package:evently/firebase/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../core/utils/validation.dart';
import '../l10n/generated/app_localizations.dart';


//ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "/ForgotPassword";

  ForgotPasswordScreen({super.key});

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.forgetPassword,
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppAssets.resetPasswordImg,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: TextFormField(
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
                ),
                SizedBox(height: size.height * 0.02),
                FilledButton(
                  onPressed: () {
                    if (ValidationCheck.validateEmail(
                            emailController.text, locale) == null){
                      try{
                        FirebaseAuthServices().forgotPassword(emailController.text);
                        Navigator.pop(context);

                      }catch(error){
                        debugPrint(error.toString());
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(locale.resetPassword)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
