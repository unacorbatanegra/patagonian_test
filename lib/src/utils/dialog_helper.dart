import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DialogHelper {
  static Future<void> infoDialog(String title, String message) => Get.dialog(
        AlertDialog(
          title: Text(
            title,
            style: Get.textTheme.subtitle1.copyWith(
              fontSize: 20,
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'ACCEPT',
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
