import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hr/core/shared/circular_image_widget.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => controller.onPopInvoked(),
      child: Scaffold(
        body: const SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}
