// ignore_for_file: non_constant_identifier_names

import 'package:chit_chat/utils/size_config.dart';

extension NumberExt on num {
  double get height => this * (SizeConfig.height / 100);
  double get width => this * (SizeConfig.width / 100);
  double get _min_size => SizeConfig.isPortrait ? SizeConfig.width : SizeConfig.height;
  double get sp => this * ((_min_size / 3) / 100);
  double get widthRatio => this * (_min_size / 100);
}

extension ParseNullableInt on int? {
  int get parseInt => this ?? 0;
  double get parseDouble => this == null ? 0 : this!.toDouble();
  double get intToDouble => this == null ? 0 : this!.toDouble();
}
