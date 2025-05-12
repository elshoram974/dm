import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/shared/responsive/constrained_box.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_assets.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

import '../../../../core/shared/filled_button.dart';
import '../widgets/auth_field.dart';
import '../widgets/password_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signUp),
        centerTitle: true,
      ),
      body: MyResConstrainedBoxAlign(
        child: ListView(
          padding: const EdgeInsets.all(AppConst.defaultPadding),
          children: [
            Image.asset(
              AppAssets.logo,
              height: MediaQuery.sizeOf(context).height * 0.18,
            ),
            const SizedBox(height: AppConst.defaultPadding),
            Form(
              key: formKey,
              child: Column(
                children: [
                  AuthField(
                    readOnly: isLoading,
                    label: S.of(context).name,
                    hintText: 'Enter your name',
                    autofillHints: const [AutofillHints.name],
                    suffixIconData: Icons.person_outline,
                    validator: (val) {
                      if (val?.trim() == '') {
                        return S.of(context).fillField;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 2 * AppConst.defaultPadding),
                  AuthField(
                    isPhoneNumber: true,
                    label: S.of(context).mobileNumber,
                    hintText: S.of(context).enterYourMobileNumber,
                    autofillHints: const [AutofillHints.telephoneNumber],
                  ),
                  const SizedBox(height: 2 * AppConst.defaultPadding),
                  PasswordField(
                    label: "New Password",
                    hintText: S.of(context).enterThePassword,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.maxFinite,
                    child: CustomFilledButton(
                      text: S.of(context).signUp,
                      isLoading: isLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          Future.delayed(const Duration(seconds: 3), Get.back);
                        }
                      },
                      style: context.textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
