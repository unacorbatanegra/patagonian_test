import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DialogHelper {
  static Future<bool> ifDialog(
    String mensaje,
  ) async {
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: Text(
          'ATENCION',
          style: Get.textTheme.subtitle1.copyWith(
              fontSize: 20,
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold),
        ),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'CANCELAR',
              style: Get.textTheme.button.copyWith(
                color: Get.theme.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Get.back(result: false),
          ),
          FlatButton(
            child: Text(
              'ACEPTAR',
              style: Get.textTheme.button.copyWith(
                color: Get.theme.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Get.back(result: true),
          )
        ],
      ),
      useRootNavigator: true,
    );
    return result ?? false;
  }

  static Future<void> infoDialog(String mensaje) async {
    return Get.dialog(
      AlertDialog(
        title: Text(
          'ATENCION',
          style: Get.textTheme.subtitle1.copyWith(
            fontSize: 20,
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'ACEPTAR',
              style: Get.textTheme.button.copyWith(
                color: Get.theme.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: Get.back,
          )
        ],
      ),
    );
  }

  static Future<void> infoMessage(
      {String title, String message, bool barrierDismissible = true}) {
    return Get.dialog(
      AlertDialog(
        title: Text(
          title,
          style: Get.textTheme.subtitle1.copyWith(fontSize: 20),
        ),
        content: Container(
          width: double.infinity,
          child: Text(
            message,
            maxLines: 3,
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }
}
