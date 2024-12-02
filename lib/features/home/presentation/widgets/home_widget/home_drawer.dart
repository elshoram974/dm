import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/config/routes/routes.dart';

import '../../controller/home_controller.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Spacer(),
          DrawerTileWidget(
            icon: Icons.description_outlined,
            title: S.of(context).privacyPolicy,
            onTap: () => Get.toNamed(AppRoute.privacy),
          ),
          DrawerTileWidget(
            icon: Icons.policy_outlined,
            title: S.of(context).termsConditions,
            onTap: () => Get.toNamed(AppRoute.terms),
          ),
          const Spacer(flex: 2),
          DrawerTileWidget(
            icon: Icons.logout,
            title: S.of(context).logOut,
            onTap: Get.find<HomeController>().logOut,
          ),
        ],
      ),
    );
  }
}

class DrawerTileWidget extends StatelessWidget {
  const DrawerTileWidget({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });
  final void Function()? onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
