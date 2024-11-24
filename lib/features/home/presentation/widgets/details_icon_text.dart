import 'package:flutter/material.dart';
import 'package:shora/core/utils/constants/app_constants.dart';

class DetailsIconText extends StatelessWidget {
  const DetailsIconText({
    super.key,
    required this.icon,
    required this.text,
    this.fontSize = 14,
  });
  final IconData icon;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
          fontSize == 14 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey, size: 18),
        SizedBox(width: AppConst.defaultExtraSmallPadding),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: fontSize),
          ),
        ),
      ],
    );
  }
}
