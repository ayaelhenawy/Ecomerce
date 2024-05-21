import "package:flutter/material.dart";
import "package:my_project/core2/lang/cubit/parent_cubit.dart";

extension MyTheme on BuildContext {
  ThemeData get getTheme => Theme.of(this);
}

extension MyLocalization on String {
  String get tr => ParentCubit.instance.local[this] ?? toUpperCase();
}
