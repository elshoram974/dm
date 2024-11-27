import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:shora/core/utils/extensions/string_ex.dart';

class TextAnswerWidget extends StatefulWidget {
  const TextAnswerWidget({
    super.key,
    this.initText,
    this.onChanged,
  });

  final String? initText;
  final void Function(String)? onChanged;

  @override
  State<TextAnswerWidget> createState() => _TextAnswerWidgetState();
}

class _TextAnswerWidgetState extends State<TextAnswerWidget> {
  late TextDirection? direction = widget.initText?.direction;
  late bool readOnly = widget.initText != null && widget.onChanged == null;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      initialValue: widget.initText,
      onChanged: widget.onChanged == null
          ? null
          : (val) => {changeDirection(val), widget.onChanged!(val)},
      textDirection: direction,
      maxLines: 5,
      style: TextStyle(
        fontSize: 12,
        fontWeight: readOnly ? null : FontWeight.w900,
      ),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: "Type your answer here ...",
        contentPadding: const EdgeInsets.all(AppConst.smallPadding),
        hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppConst.borderSmallRadius),
        ),
        filled: true,
        fillColor: readOnly
            ? Colors.greenAccent.shade100
            : context.theme.cardColor.withOpacity(0.5),
      ),
    );
  }

  void changeDirection(String text) {
    direction = text.direction;
    setState(() {});
  }
}
