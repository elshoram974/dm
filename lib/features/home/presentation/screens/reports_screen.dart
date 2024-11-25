import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/customer_card_entity.dart';
import '../controller/home_controller.dart';
import '../widgets/customer_card_widget.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return SafeArea(
            bottom: false,
            child: CustomScrollView(
              physics: controller.getCustomerStatus is Loading
                  ? const NeverScrollableScrollPhysics()
                  : null,
              slivers: [
                SliverAppBar(
                  title: Text(S.of(context).reports),
                  centerTitle: true,
                  leadingWidth: 100,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    onPressed: Get.back,
                    icon: Row(
                      children: [
                        const Icon(Icons.arrow_back_ios),
                        Text(S.of(context).back),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  elevation: 0,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(height: AppConst.defaultSmallPadding),
                      if (controller.getCustomerStatus is Loading)
                        ...List<Widget>.generate(
                          10,
                          (int i) => Skeletonizer(
                            containersColor: context.theme.cardColor,
                            child: CustomerCardWidget(
                              entity: CustomerCardEntity.example(),
                            ),
                          ),
                        )
                      else
                        ...List<Widget>.generate(
                          controller.customers.length,
                          (int index) {
                            return CustomerCardWidget(
                              entity: controller.customers[index],
                            );
                          },
                        ),
                      const SizedBox(height: AppConst.defaultPadding),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
