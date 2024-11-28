import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shora/core/default_field.dart';
import 'package:shora/core/shared/empty_widget.dart';
import 'package:shora/core/shared/responsive/constrained_box.dart';
import 'package:shora/core/status/status.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/customer_card_entity.dart';
import '../controller/home_controller.dart';
import '../widgets/home_widget/customer_card_widget.dart';
import '../widgets/home_widget/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) =>
          Get.find<HomeController>().onPopInvoked(),
      child: Scaffold(
        endDrawer: const HomeDrawer(),
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
                    if (controller.getCustomerStatus is Loading &&
                        controller.inSearch)
                      const SliverPadding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppConst.smallPadding,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      ),
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
                                    .loadingMore &&
                                !controller.inSearch)
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
    String query = '';
    final FocusNode focus = FocusNode();
    return AppBar(
      title: MyResConstrainedBoxAlign(
        child: GetBuilder<HomeController>(builder: (controller) {
          return MyDefaultField(
            controller: controller.textController,
            hintText: S.of(context).findWhatYouAreLookingFor,
            textInputAction: TextInputAction.search,
            onEditingComplete: controller.debouncer.cancel,
            focusNode: focus,
            onFieldSubmitted: (_) {
              controller.getCustomersSearch(query);
              focus.unfocus();
            },
            prefix: controller.inSearch
                ? BackButton(
                    style: IconButton.styleFrom(iconSize: 18),
                    onPressed: () {
                      query = '';
                      controller.debouncer.cancel();
                      focus.unfocus();
                      controller.changeQuerySearch(null);
                    },
                  )
                : null,
            suffix: IconButton(
              onPressed: () {
                if (controller.inSearch) {
                  controller.getCustomersSearch(query);
                } else {
                  _focusSearch(focus);
                }
              },
              icon: const Icon(Icons.search),
            ),
            onTap: () => _focusSearch(focus),
            onChanged: (val) {
              if (!controller.inSearch) controller.changeQuerySearch(val);
              query = val;
              controller.debouncer(() => controller.getCustomersSearch(query));
            },
          );
        }),
      ),
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
    );
  }

  void _focusSearch(FocusNode focus) {
    focus.requestFocus();
    Get.find<HomeController>().changeQuerySearch('');
  }
}