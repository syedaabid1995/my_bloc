import 'dart:async';
import 'package:bloc/bloc.dart';
import '../app_themes.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(ThemeState initialState) : super(initialState);


  @override
  ThemeState get initialState =>
      ThemeState(themeData: appThemeData[AppTheme.dark]);

  @override
  Stream<ThemeState> mapEventToState(
      ThemeEvent event,
      ) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: appThemeData[event.theme]);
    }
  }
}
