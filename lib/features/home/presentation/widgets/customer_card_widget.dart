import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shora/core/shared/circular_image_widget.dart';
import 'package:shora/core/shared/filled_button.dart';
import 'package:shora/core/shared/responsive/constrained_box.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

import '../../domain/entity/customer_card_entity.dart';
import 'details_icon_text.dart';

class CustomerCardWidget extends StatelessWidget {
  const CustomerCardWidget({
    super.key,
    required this.entity,
    this.onPressFav,
  });
  final CustomerCardEntity entity;
  final void Function()? onPressFav;

  @override
  Widget build(BuildContext context) {
    return MyResConstrainedBoxAlign(
      child: Container(
        height: 180,
        margin: EdgeInsets.only(
          bottom: AppConst.defaultSmallPadding,
          left: AppConst.defaultPadding,
          right: AppConst.defaultPadding,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConst.borderSmallRadius),
          boxShadow: [BoxShadow(blurRadius: 0.4)],
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.all(AppConst.defaultPadding),
                color: entity.color.withOpacity(0.4),
                child: Row(
                  children: [
                    _CardImageAndVerifiedWidget(entity: entity),
                    SizedBox(width: AppConst.defaultPadding),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DetailsIconText(
                            icon: Icons.person_rounded,
                            text: "#${entity.customerId}",
                          ),
                          DetailsIconText(
                            icon: Icons.medical_services_rounded,
                            text: entity.name,
                          ),
                          DetailsIconText(
                            icon: Icons.home_rounded,
                            text: entity.place,
                          ),
                          DetailsIconText(
                            icon: Icons.location_on_rounded,
                            fontSize: 12,
                            text: entity.address,
                          ),
                          if (entity.lastOrderDate != null)
                            DetailsIconText(
                              icon: Icons.calendar_month_rounded,
                              text: S.of(context).lastOrder(
                                    DateFormat.yMMMd()
                                        .format(entity.lastOrderDate!),
                                  ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              start: 0,
              top: 0,
              child: IconButton(
                onPressed: onPressFav,
                color: entity.color,
                icon: Icon(
                  entity.isFavorite
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  fill: 1,
                  shadows: [BoxShadow(spreadRadius: 90)],
                ),
              ),
            ),
            PositionedDirectional(
              end: AppConst.defaultSmallPadding,
              top: AppConst.defaultSmallPadding,
              child: ReportsOrderButtonsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportsOrderButtonsWidget extends StatelessWidget {
  const ReportsOrderButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFilledButton(
          text: S.of(context).reports,
          makeFittedBox: true,
          padding: EdgeInsets.zero,
          minimumSize: Size(70, 28),
          filledColor: context.theme.colorScheme.secondary,
          onPressed: () {},
        ),
        SizedBox(height: AppConst.defaultSmallPadding),
        CustomFilledButton(
          text: S.of(context).orders,
          makeFittedBox: true,
          padding: EdgeInsets.zero,
          minimumSize: Size(70, 28),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _CardImageAndVerifiedWidget extends StatelessWidget {
  const _CardImageAndVerifiedWidget({required this.entity});

  final CustomerCardEntity entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularImageWidget(
          imageUrl: entity.image,
          radius: 100,
        ),
        SizedBox(height: AppConst.defaultSmallPadding),
        if (entity.isVerified)
          Text(
            S.of(context).verified,
            style: TextStyle(
              fontSize: 12,
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
          )
        else
          Text(
            S.of(context).unverified,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.error,
            ),
          )
      ],
    );
  }
}
