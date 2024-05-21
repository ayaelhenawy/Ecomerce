import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'dart:convert'; // Add this import statement

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  static final ParentCubit instance = ParentCubit();
  ThemeMode themeMode = ThemeMode.light;

  ParentCubit() : super(ParentInitial()) {
    loadLanguage();
  }

  Map<String, dynamic> local = {};

  String lang = 'ar';
  Future<void> loadLanguage() async {
    String s = await rootBundle.loadString('assets/lang/$lang.json');
    //   String s = await rootBundle.loadString('assets/lang/an.json');
    local = json.decode(s);
    emit(ParentInitial());
  }

  void changeLang() {
    if (lang == 'ar') {
      lang = 'an';
    } else {
      lang = 'ar';
    }
    loadLanguage();
    emit(ParentInitial());
  }
}
