import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_oncology/utils/shared_prefs.dart';

import '../../utils/language_keys.dart';
import 'language_enum.dart';


class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(Locale('fr', 'FR')));

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is LanguageLoadStarted) {
      yield* _mapLanguageLoadStartedToState();
    } else if (event is LanguageSelected) {
      print('syedaabid');
      yield* _mapLanguageSelectedToState(event.languageCode);
    }
  }

  Stream<LanguageState> _mapLanguageLoadStartedToState() async* {
    final sharedPrefService = await SharedPreferencesService.instance;

    final defaultLanguageCode = sharedPrefService?.languageCode;
    Locale locale;

    if (defaultLanguageCode == null) {
      locale = Locale('en', 'US');
      await sharedPrefService?.setLanguage(locale.languageCode);
    } else {
      locale = Locale(defaultLanguageCode);
    }

    yield LanguageState(locale);
  }

  Stream<LanguageState> _mapLanguageSelectedToState(
      Language selectedLanguage) async* {
    final sharedPrefService = await SharedPreferencesService.instance;
    final defaultLanguageCode = sharedPrefService!.languageCode;
    print('selectedLanguage $selectedLanguage ${Language.FR}');
    print('defaultLanguageCode $defaultLanguageCode ${LanguageKeys.fr}');

    if(selectedLanguage == Language.EN){
      print("MyEnglish");
      yield* _loadLanguage(sharedPrefService, 'en', 'EN');
    }
    else if(selectedLanguage == Language.FR){
      print("MyFrench");
      yield* _loadLanguage(sharedPrefService, 'fr', 'FR');
    }


    // if (selectedLanguage == Language.FR &&
    //     defaultLanguageCode != LanguageKeys.fr) {
    //   print('defaultLanguageCode $defaultLanguageCode');
    //   yield* _loadLanguage(sharedPrefService, 'fr', 'FR');
    // }
    // else
    //   if (selectedLanguage == Language.EN &&
    //     defaultLanguageCode != LanguageKeys.en) {
    //   yield* _loadLanguage(sharedPrefService, 'en', 'US');
    // }
  }

  /// This method is added to reduce code repetition.
  Stream<LanguageState> _loadLanguage(
      SharedPreferencesService sharedPreferencesService,
      String languageCode,
      String countryCode) async* {
    final locale = Locale(languageCode, countryCode);
    print(locale);
    await sharedPreferencesService.setLanguage(locale.languageCode);
    yield LanguageState(locale);
  }
}

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageLoadStarted extends LanguageEvent {}

class LanguageSelected extends LanguageEvent {
  final Language languageCode;

  LanguageSelected(this.languageCode) : assert(languageCode != null);

  @override
  List<Object> get props => [languageCode];
}

class LanguageState extends Equatable {
  final Locale lcoale;

  LanguageState(this.lcoale) : assert(lcoale != null);

  @override
  List<Object> get props => [lcoale];
}
