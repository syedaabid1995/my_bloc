
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_localization.dart';

void snackBar(context,String message) {
  if (AppLocalizations.of(context)!.translate(message) != null) {
    message = AppLocalizations.of(context)!.translate(message).toString();
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: appRedColor,
        content: Container(
          child: Text(
            message,

            style: TextStyle(color: Colors.white),
          ),
        )),
  );
}
