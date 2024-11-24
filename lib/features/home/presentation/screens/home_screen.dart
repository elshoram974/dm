import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shora/core/default_field.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

import '../../domain/entity/customer_card_entity.dart';
import '../controller/home_controller.dart';
import '../widgets/customer_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => controller.onPopInvoked(),
      child: Scaffold(
        appBar: AppBar(
          title: MyDefaultField(
            hintText: S.of(context).findWhatYouAreLookingFor,
            suffix: Icon(Icons.search),
          ),
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: AppConst.defaultSmallPadding),
                      ...List.generate(
                        50,
                        (index) {
                          return CustomerCardWidget(
                            onPressFav: () {},
                            entity: CustomerCardEntity(
                              customerId:
                                  "${Random(index * 1000).nextInt(999999)}",
                              name: "name of customer $index",
                              place: "place of customer $index",
                              address:
                                  'close to English school, 1st settlement, moustafa kamel axis, second new cairo, Cairo Governorate',
                              isFavorite: index.isOdd,
                              isVerified: index.isEven,
                              image:
                                  "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
                              color: index.isEven
                                  ? Theme.of(context).cardColor
                                  : Theme.of(context).primaryColor,
                              lastOrderDate: DateTime.now().subtract(
                                Duration(hours: index * 60, days: index * 31),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: AppConst.defaultPadding),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
