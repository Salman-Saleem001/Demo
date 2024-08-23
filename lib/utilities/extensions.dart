// ignore_for_file: camel_case_extensions, unnecessary_this

import 'package:flutter/material.dart';

extension sizedBoxExtension on num {
  Widget get hp => SizedBox(
    height: this.toDouble(),
  );

  Widget get wp => SizedBox(
    width: this.toDouble(),
  );
}