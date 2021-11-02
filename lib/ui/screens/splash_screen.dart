import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_oncology/blocs/initial_settings/initial_bloc.dart';

import '../../../main.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    // ignore: close_sinks
    final serverSettingsBloc = BlocProvider.of<InitialBloc>(context);
    serverSettingsBloc.add(GetInitialSettings(userBox));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitialBloc, PostEventState>(
      listener: (context, state) {
        new Timer(const Duration(seconds:2),(){

          //TODO : Navigate to particular page
          // if (state is Loaded) {
          //   Future.microtask(() => Navigator.of(context).pushReplacement(
          //       CupertinoPageRoute(builder: (BuildContext context) => Login())));
          // }else{
          //   Future.microtask(() => Navigator.of(context).pushReplacement(
          //       CupertinoPageRoute(builder: (BuildContext context) => Login())));
          //
          // }

        });
      },
      child: ScreenUi(),
    );
  }
}

class ScreenUi extends StatelessWidget {
  const ScreenUi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            child: Image.asset('assets/images/logo.jpeg',fit: BoxFit.fill,),

          ),
        ),
      ),
    );
  }
}

