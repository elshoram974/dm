import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shora/core/utils/config/locale/generated/l10n.dart';
import 'package:shora/core/utils/constants/app_constants.dart';
import 'package:shora/core/utils/extensions/date_ex.dart';
import 'package:shora/core/utils/extensions/responsive_ex.dart';

class SelectDateRangeWidget extends StatefulWidget {
  const SelectDateRangeWidget({
    super.key,
    this.onSelectRange,
    this.onRemoveDateRange,
    this.initRange,
  });
  final DateTimeRange? initRange;
  final FutureOr<void> Function(DateTimeRange)? onSelectRange;
  final void Function()? onRemoveDateRange;

  @override
  State<SelectDateRangeWidget> createState() => _SelectDateRangeWidgetState();
}

class _SelectDateRangeWidgetState extends State<SelectDateRangeWidget> {
  String? selectedDate;
  @override
  void initState() {
    selectedDate =
        widget.initRange == null ? null : rangeToString(widget.initRange!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, __) => setState(() => selectedDate = null),
      child: InkWell(
        onTap: widget.onSelectRange == null
            ? null
            : () {
                showDateRangePicker(
                  context: context,
                  confirmText: S.of(context).search,
                  saveText: S.of(context).search,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDateRange: widget.initRange,
                  builder: context.isPhoneWidth
                      ? null
                      : (context, child) {
                          final Size size = MediaQuery.sizeOf(context);
                          return Align(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  AppConst.defaultPadding),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: size.shortestSide * 0.7,
                                  maxHeight: size.longestSide * 0.5,
                                ),
                                child: child,
                              ),
                            ),
                          );
                        },
                  firstDate: DateTime(2024),
                  lastDate: DateTime.now(),
                ).then(
                  (value) {
                    if (value == null) return;
                    final DateTimeRange range = DateTimeRange(
                      start: value.start,
                      end: value.end.copyWith(hour: 23, minute: 59, second: 59),
                    );
                    widget.onSelectRange!(range);
                    selectedDate = rangeToString(range);
                    setState(() {});
                  },
                );
              },
        borderRadius: BorderRadius.circular(AppConst.borderSmallRadius),
        child: Container(
          height: 45,
          padding: EdgeInsetsDirectional.only(
            start: selectedDate == null ? 12 : 0,
            end: 12,
          ),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(AppConst.borderSmallRadius),
          ),
          child: Row(
            children: [
              if (selectedDate != null)
                IconButton(
                  onPressed: () {
                    if (widget.onRemoveDateRange != null) {
                      widget.onRemoveDateRange!();
                    }
                    setState(() => selectedDate = null);
                  },
                  icon: const Icon(Icons.close),
                ),
              Expanded(
                child: selectedDate != null
                    ? Text(selectedDate!, textAlign: TextAlign.center)
                    : Text(
                        S.of(context).selectDate,
                        style: const TextStyle(color: Colors.grey),
                      ),
              ),
              Icon(
                Icons.calendar_month,
                color: selectedDate != null ? null : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String rangeToString(DateTimeRange range) =>
      "${range.start.ddMMYYYYSlash} - ${range.end.ddMMYYYYSlash}";
}
