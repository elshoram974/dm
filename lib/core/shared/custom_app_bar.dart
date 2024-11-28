import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/config/locale/generated/l10n.dart';
import '../utils/constants/app_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, this.bottom, this.titleColor, required this.title});
  final Color? titleColor;
  final Widget? bottom;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleTextStyle: context.textTheme.titleMedium?.copyWith(
        color: titleColor,
        fontWeight: FontWeight.w600,
      ),
      centerTitle: true,
      leadingWidth: 110,
      leading: const LeadingBackButton(),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      bottom: bottom == null
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConst.defaultPadding,
                ),
                child: bottom,
              ),
            ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 40 : 100);
}

class LeadingBackButton extends StatelessWidget {
  const LeadingBackButton({super.key, this.size});
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Align(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
          child: IconButton(
            onPressed: Get.back,
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_back_ios, size: 16),
                Text(
                  S.of(context).back,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
