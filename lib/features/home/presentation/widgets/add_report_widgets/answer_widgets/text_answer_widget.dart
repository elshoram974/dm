import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:shora/core/utils/extensions/string_ex.dart';

import '../../../../data/models/question_model.dart';

class TextAnswerWidget extends StatefulWidget {
  const TextAnswerWidget({
    super.key,
    required this.question,
    this.onChanged,
  });

  final QuestionModel question;
  final void Function(QuestionModel)? onChanged;

  @override
  State<TextAnswerWidget> createState() => _TextAnswerWidgetState();
}

class _TextAnswerWidgetState extends State<TextAnswerWidget> {
  late TextDirection? direction = widget.question.ansA?.direction;
  late bool readOnly = widget.question.ansA != null && widget.onChanged == null;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      initialValue: widget.question.ansA,
      onChanged: widget.onChanged == null
          ? null
          : (String val) {
              changeDirection(val);
              widget.onChanged!(
                QuestionModel(
                  id: widget.question.id,
                  question: widget.question.question,
                  type: widget.question.type,
                  ansA: val.trim().isEmpty ? null : val.trim(),
                  ansB: null,
                  ansC: null,
                  ansD: null,
                  ansABool: false,
                  ansBBool: false,
                  ansCBool: false,
                  ansDBool: false,
                ),
              );
            },
      textDirection: direction,
      maxLines: 5,
      style: TextStyle(
        fontSize: 12,
        fontWeight: readOnly ? FontWeight.w900 : null,
      ),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: S.of(context).typeYourAnswerHere_,
        contentPadding: const EdgeInsets.all(AppConst.smallPadding),
        hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppConst.borderSmallRadius),
        ),
        filled: true,
        fillColor: readOnly
            ? context.theme.primaryColor.withOpacity(0.25)
            : context.theme.cardColor.withOpacity(0.5),
      ),
    );
  }

  void changeDirection(String text) {
    direction = text.direction;
    setState(() {});
  }
}
