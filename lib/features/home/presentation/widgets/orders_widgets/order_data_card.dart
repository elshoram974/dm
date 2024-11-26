import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:shora/core/utils/extensions/date_ex.dart';

import '../../../domain/entity/order_card_entity.dart';

class OrderDataCard extends StatelessWidget {
  const OrderDataCard({super.key, required this.orderData});
  final OrderCardEntity orderData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppConst.smallPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.defaultPadding,
        vertical: AppConst.smallPadding,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (orderData.orderOwnerName != null)
                  _Text(
                    orderData.orderOwnerName!,
                    color: context.theme.primaryColor,
                  ),
                _Text(S.of(context).orderNoNumber(orderData.orderNo)),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Text(
                  S
                      .of(context)
                      .amountEGP(orderData.totalAmount.toStringAsFixed(2)),
                  color: context.theme.primaryColor,
                ),
                _Text(orderData.createdAt.ddMMYYYY),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDataCardHeader extends StatelessWidget {
  const OrderDataCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppConst.smallPadding,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.defaultPadding,
        vertical: AppConst.smallPadding,
      ),
      color: context.theme.primaryColor.withOpacity(0.1),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: _Text(S.of(context).orderNo),
          ),
          Expanded(flex: 4, child: _Text(S.of(context).totalOrder)),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text(this.text, {this.color, this.decoration});

  final String text;
  final Color? color;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
          decoration: decoration,
        ),
      ),
    );
  }
}
