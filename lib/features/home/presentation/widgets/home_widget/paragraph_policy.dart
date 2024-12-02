import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ParagraphPolicy extends StatelessWidget {
  const ParagraphPolicy({
    super.key,
    this.title,
    this.titleFontSize = 18,
    this.paragraph,
    this.onTap,
  });
  final String? title;
  final String? paragraph;
  final double titleFontSize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          if (title != null)
            TextSpan(
              text: "$title\n",
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (paragraph != null)
            TextSpan(
              text: "$paragraph\n",
              style: onTap == null
                  ? null
                  : TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
        ],
      ),
    );
  }
}
