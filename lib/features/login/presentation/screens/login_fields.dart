import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

import '../controller/login_controller.dart';
import '../widgets/auth_field.dart';
import '../widgets/password_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return AutofillGroup(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                AuthField(
                  readOnly: controller.isLoading,
                  isPhoneNumber: true,
                  onPhoneInputChanged: (v) => controller.phone = v,
                  label: S.of(context).mobileNumber,
                  hintText: S.of(context).enterYourMobileNumber,
                  autofillHints: const [AutofillHints.email],
                ),
                const SizedBox(height: 2 * AppConst.defaultPadding),
                PasswordField(
                  readOnly: controller.isLoading,
                  label: S.of(context).password,
                  hintText: S.of(context).enterThePassword,
                  onFieldSubmitted: (_) => controller.login(),
                  onChanged: (val) => controller.password = val,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
