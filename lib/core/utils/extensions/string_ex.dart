import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

extension StringHelper on String {
  String get removeZerosInFirst => replaceFirst(RegExp(r'^0+'), '').trim();
  
  bool get isRTL => intl.Bidi.detectRtlDirectionality(this);

  TextDirection get direction => isRTL ? TextDirection.rtl : TextDirection.ltr;
}
