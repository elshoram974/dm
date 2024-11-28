import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:shora/core/default_field.dart';
import 'package:shora/core/shared/empty_widget.dart';
import 'package:shora/core/shared/responsive/constrained_box.dart';
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
        appBar: homeAppBar(context),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return RefreshIndicator(
              onRefresh: () => controller.getCustomers(true),
              child: SafeArea(
                bottom: false,
                child: CustomScrollView(
                  controller: controller.scrollController,
                  physics: controller.getCustomerStatus is Loading &&
                          !(controller.getCustomerStatus as Loading).loadingMore
                      ? const NeverScrollableScrollPhysics()
                      : null,
                  slivers: [
                    if (controller.getCustomerStatus is! Loading &&
                        controller.customers.isEmpty)
                      const SliverFillRemaining(child: EmptyWidget())
                    else
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            const SizedBox(height: AppConst.smallPadding),
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

  AppBar homeAppBar(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final Debouncer debouncer = Debouncer(
      delay: const Duration(milliseconds: AppConst.debounceMilliseconds),
    );
    return AppBar(
      title: MyResConstrainedBoxAlign(
        child: MyDefaultField(
          hintText: S.of(context).findWhatYouAreLookingFor,
          textInputAction: TextInputAction.search,
          onEditingComplete: () {
            print("debouncer is running : ${debouncer.isRunning}");
            debouncer.cancel();
            print("debouncer is running after cancel : ${debouncer.isRunning}");
          },
          suffix: const Icon(Icons.search),
          onChanged: (val) {
            if (val.isNotEmpty) {
              debouncer(() => print(val));
            } else {
              debouncer.cancel();
            }
          },
        ),
      ),
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
    );
  }
}
