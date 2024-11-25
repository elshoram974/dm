import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shora/core/default_field.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/customer_card_entity.dart';
import '../controller/home_controller.dart';
import '../widgets/customer_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) =>
          Get.find<HomeController>().onPopInvoked(),
      child: Scaffold(
        appBar: AppBar(
          title: MyDefaultField(
            hintText: S.of(context).findWhatYouAreLookingFor,
            suffix: const Icon(Icons.search),
          ),
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return RefreshIndicator(
              onRefresh: () => controller.getCustomers(true),
              child: SafeArea(
                bottom: false,
                child: CustomScrollView(
                  controller: controller.scrollController,
                  physics: controller.getCustomerStatus is Loading
                      ? const NeverScrollableScrollPhysics()
                      : null,
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const SizedBox(height: AppConst.defaultSmallPadding),
                          if (controller.getCustomerStatus is Loading &&
                              !(controller.getCustomerStatus as Loading)
                                  .loadingMore)
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
                          if (controller.getCustomerStatus is Loading &&
                              (controller.getCustomerStatus as Loading)
                                  .loadingMore) ...[
                            const SizedBox(height: AppConst.defaultPadding),
                            const Center(child: CircularProgressIndicator()),
                          ],
                          const SizedBox(height: AppConst.defaultPadding),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
