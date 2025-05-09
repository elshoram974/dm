import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/shared/empty_widget.dart';
import 'package:shora/core/shared/custom_app_bar.dart';
import 'package:shora/core/shared/responsive/constrained_box.dart';
import 'package:shora/core/shared/select_date_range_widget.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/order_card_entity.dart';
import '../controller/orders_controller.dart';
import '../widgets/orders_widgets/order_data_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) =>
          Get.find<OrdersController>().onPopInvoked(),
      child: Scaffold(
        appBar: customAppBar(context),
        body: GetBuilder<OrdersController>(
          builder: (controller) {
            return SafeArea(
              bottom: false,
              child: CustomScrollView(
                physics: controller.getOrderStatus is Loading &&
                        (controller.getOrderStatus as Loading).loadingMore
                    ? const NeverScrollableScrollPhysics()
                    : null,
                slivers: [
                  if (controller.getOrderStatus is! Loading &&
                      controller.orders.isEmpty)
                    const SliverFillRemaining(child: EmptyWidget())
                  else
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const SizedBox(height: AppConst.smallPadding),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppConst.defaultPadding,
                            ),
                            child: MyResConstrainedBoxAlign(
                              child: Column(
                                children: [
                                  const OrderDataCardHeader(),
                                  if (controller.getOrderStatus is Loading &&
                                      !(controller.getOrderStatus as Loading)
                                          .loadingMore)
                                    ...List<Widget>.generate(
                                      10,
                                      (int i) => Skeletonizer(
                                        containersColor:
                                            context.theme.cardColor,
                                        child: OrderDataCard(
                                          orderData: OrderCardEntity.example(),
                                        ),
                                      ),
                                    )
                                  else ...[
                                    ...List<Widget>.generate(
                                      controller.orders.length,
                                      (int i) => OrderDataCard(
                                        orderData: controller.orders[i],
                                      ),
                                    )
                                  ],
                                ],
                              ),
                            ),
                          ),
                          if (controller.getOrderStatus is Loading &&
                              (controller.getOrderStatus as Loading)
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
            );
          },
        ),
      ),
    );
  }

  CustomAppBar customAppBar(BuildContext context) {
    return CustomAppBar(
      title: S.of(context).orders,
      titleColor: context.theme.primaryColor,
      onPressBack: Get.find<OrdersController>().onPopInvoked,
      bottom: MyResConstrainedBoxAlign(
        child: GetBuilder<OrdersController>(
          builder: (controller) {
            return SelectDateRangeWidget(
              initRange: controller.range,
              onSelectRange: (range) {
                controller.range = range;
                controller.getOrders(false);
              },
              onRemoveDateRange: () {
                controller.range = null;
                controller.getOrders(false);
              },
            );
          },
        ),
      ),
    );
  }
}
