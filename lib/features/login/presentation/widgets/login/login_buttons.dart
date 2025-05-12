import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/shared/filled_button.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';

import '../../../../../core/utils/config/routes/routes.dart';
import '../../controller/login_controller.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Align(
          //   alignment: AlignmentDirectional.centerStart,
          //   child: TextButton(
          //     onPressed: controller.isLoading ? null : () {},
          //     child: Text(
          //       S.of(context).forgetPassword,
          //       style: context.textTheme.bodyLarge,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 30),
          CustomFilledButton(
            text: S.of(context).login,
            isLoading: controller.isLoading,
            onPressed: controller.login,
            style: context.textTheme.headlineMedium,
          ),
          const SizedBox(height: 70),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: context.textTheme.titleMedium, children: [
              TextSpan(text: S.of(context).doNotHaveAnAccount),
              const TextSpan(text: ' '),
              TextSpan(
                  text: S.of(context).signUp,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.theme.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: context.theme.primaryColor,
                    decorationThickness: 2,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(AppRoute.signUp)),
            ]),
          ),
        ],
      );
    });
  }
}
