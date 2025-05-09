import 'package:flutter/material.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:shora/core/utils/extensions/responsive_ex.dart';

import '../../../../data/models/question_model.dart';
import 'check_box_answer_widget.dart';
import 'radio_answer_widget.dart';

class SelectedAnswersGrid extends StatefulWidget {
  const SelectedAnswersGrid({
    super.key,
    required this.question,
    this.onChanged,
  });

  final QuestionModel question;
  final void Function(QuestionModel)? onChanged;

  @override
  State<SelectedAnswersGrid> createState() => _SelectedAnswersGridState();
}

class _SelectedAnswersGridState extends State<SelectedAnswersGrid> {
  String chosenAns = '';
  List<String> selectedAnswers = List.empty(growable: true);
  void initAnswers() {
    if (widget.question.ansABool) {
      chosenAns = widget.question.ansA ?? chosenAns;
      if (chosenAns.isNotEmpty) selectedAnswers.add(chosenAns);
    }
    if (widget.question.ansBBool) {
      chosenAns = widget.question.ansB ?? chosenAns;
      if (chosenAns.isNotEmpty) selectedAnswers.add(chosenAns);
    }
    if (widget.question.ansCBool) {
      chosenAns = widget.question.ansC ?? chosenAns;
      if (chosenAns.isNotEmpty) selectedAnswers.add(chosenAns);
    }
    if (widget.question.ansDBool) {
      chosenAns = widget.question.ansD ?? chosenAns;
      if (chosenAns.isNotEmpty) selectedAnswers.add(chosenAns);
    }

    setState(() {});
  }

  @override
  void initState() {
    initAnswers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: context.isPhoneWidth
          ? const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4,
              crossAxisSpacing: AppConst.smallPadding,
              mainAxisSpacing: AppConst.extraSmallPadding,
            )
          : const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 3.5,
              crossAxisSpacing: AppConst.smallPadding,
              mainAxisSpacing: AppConst.extraSmallPadding,
            ),
      children: [
        if (widget.question.type == QuestionType.multi) ...[
          if (widget.question.ansA != null)
            CheckBoxAnswerWidget(
              widget.question.ansA!,
              isSelected: selectedAnswers.contains(widget.question.ansA),
              onChanged: widget.onChanged == null
                  ? null
                  : (_) => addRemoveMultiAns(_!, widget.question.ansA!),
            ),
          if (widget.question.ansB != null)
            CheckBoxAnswerWidget(
              widget.question.ansB!,
              isSelected: selectedAnswers.contains(widget.question.ansB),
              onChanged: widget.onChanged == null
                  ? null
                  : (_) => addRemoveMultiAns(_!, widget.question.ansB!),
            ),
          if (widget.question.ansC != null)
            CheckBoxAnswerWidget(
              widget.question.ansC!,
              isSelected: selectedAnswers.contains(widget.question.ansC),
              onChanged: widget.onChanged == null
                  ? null
                  : (_) => addRemoveMultiAns(_!, widget.question.ansC!),
            ),
          if (widget.question.ansD != null)
            CheckBoxAnswerWidget(
              widget.question.ansD!,
              isSelected: selectedAnswers.contains(widget.question.ansD),
              onChanged: widget.onChanged == null
                  ? null
                  : (_) => addRemoveMultiAns(_!, widget.question.ansD!),
            ),
        ] else ...[
          if (widget.question.ansA != null)
            RadioAnswerWidget<String>(
              widget.question.ansA!,
              onChanged: widget.onChanged == null ? null : selectSingleChoice,
              groupValue: chosenAns,
              value: widget.question.ansA!,
            ),
          if (widget.question.ansB != null)
            RadioAnswerWidget<String>(
              widget.question.ansB!,
              onChanged: widget.onChanged == null ? null : selectSingleChoice,
              groupValue: chosenAns,
              value: widget.question.ansB!,
            ),
          if (widget.question.ansC != null)
            RadioAnswerWidget<String>(
              widget.question.ansC!,
              onChanged: widget.onChanged == null ? null : selectSingleChoice,
              groupValue: chosenAns,
              value: widget.question.ansC!,
            ),
          if (widget.question.ansD != null)
            RadioAnswerWidget<String>(
              widget.question.ansD!,
              onChanged: widget.onChanged == null ? null : selectSingleChoice,
              groupValue: chosenAns,
              value: widget.question.ansD!,
            ),
        ]
      ],
    );
  }

  void selectSingleChoice(String? val) {
    setState(() => chosenAns = val!);
    if (widget.onChanged != null) {
      widget.onChanged!(
        QuestionModel(
          id: widget.question.id,
          question: widget.question.question,
          type: widget.question.type,
          ansA: widget.question.ansA,
          ansB: widget.question.ansB,
          ansC: widget.question.ansC,
          ansD: widget.question.ansD,
          ansABool: chosenAns == widget.question.ansA,
          ansBBool: chosenAns == widget.question.ansB,
          ansCBool: chosenAns == widget.question.ansC,
          ansDBool: chosenAns == widget.question.ansD,
        ),
      );
    }
  }

  void addRemoveMultiAns(bool val, String choice) {
    setState(() {
      if (val) {
        selectedAnswers.add(choice);
      } else {
        selectedAnswers.remove(choice);
      }
    });
    if (widget.onChanged != null) {
      widget.onChanged!(
        QuestionModel(
          id: widget.question.id,
          question: widget.question.question,
          type: widget.question.type,
          ansA: widget.question.ansA,
          ansB: widget.question.ansB,
          ansC: widget.question.ansC,
          ansD: widget.question.ansD,
          ansABool: selectedAnswers.contains(widget.question.ansA),
          ansBBool: selectedAnswers.contains(widget.question.ansB),
          ansCBool: selectedAnswers.contains(widget.question.ansC),
          ansDBool: selectedAnswers.contains(widget.question.ansD),
        ),
      );
    }
  }
}
