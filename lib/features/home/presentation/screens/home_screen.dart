import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shora/core/default_field.dart';
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
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
        ),
        body: GetBuilder<HomeController>(builder: (controller) {
          return RefreshIndicator(
            onRefresh: () async {},
            child: SafeArea(
              bottom: false,
              child: CustomScrollView(
                physics: controller.isLoading
                    ? const NeverScrollableScrollPhysics()
                    : null,
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const SizedBox(height: AppConst.defaultSmallPadding),
                        if (controller.isLoading)
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
                            50,
                            (int index) {
                              return CustomerCardWidget(
                                onPressFav: () {},
                                entity: CustomerCardEntity(
                                  customerId:
                                      "${Random(index * 1000).nextInt(999999)}",
                                  name: "name of customer $index",
                                  place: "place of customer $index",
                                  address:
                                      "close to English school, 1st settlement, moustafa kamel axis, second new cairo, Cairo Governorate",
                                  isFavorite: index.isOdd,
                                  isVerified: index.isEven,
                                  image:
                                      "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
                                  color: index.isEven
                                      ? Theme.of(context).cardColor
                                      : Theme.of(context).primaryColor,
                                  lastOrderDate: DateTime.now().subtract(
                                    Duration(
                                        hours: index * 60, days: index * 31),
                                  ),
                                ),
                              );
                            },
                          ),
                        const SizedBox(height: AppConst.defaultPadding),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
