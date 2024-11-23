import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:shora/core/utils/functions/app_validate.dart';

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
                  suffixIconData: Icons.mail_outline,
                  keyboardType: TextInputType.emailAddress,
                  label: S.of(context).emailAddress,
                  hintText: S.of(context).enterEmailAddress,
                  autofillHints: const [AutofillHints.email],
                  onChanged: (val) => controller.email = val,
                  validator: (val) =>
                      AppValidator.auth(val, 0, 100, FieldType.email),
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
