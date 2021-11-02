
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'api/responses/login/login_response.dart';
import 'utils/save_to_hive.dart';

import 'app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  /// getting directory of this app
  var appDocumentDir = await getApplicationDocumentsDirectory();

  /// To build adapter files use this command "flutter packages pub run build_runner build"
  /// To Store Data in Internal memory using Hive
  Hive..init(appDocumentDir.path)
    ..registerAdapter(LoginRegisterResponseAdapter());

  userBox = await Hive.openBox(HiveKeys.userBox);
  /// Main Widget
  runApp(RestartWidget(child: MyApp()));
}
Box? userBox;

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
