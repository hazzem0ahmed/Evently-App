import 'dart:io';
import 'package:evently/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialogs {

  static Future<void> showLoadingDialog(
    BuildContext context, {
    required String loadingMessage,
    bool isDismissable = true,
  }) async {
    var size = MediaQuery.sizeOf(context);
    var content = Row(
      children: [
        Platform.isAndroid
            ? CircularProgressIndicator()
            : CupertinoActivityIndicator(),
        SizedBox(width: size.width * 0.03),
        Text(loadingMessage),
      ],
    );

    showDialog(
      barrierColor: Colors.black45,
      barrierDismissible: isDismissable,
      context: context,
      builder: (context) {
        if (Platform.isAndroid) {
          return AlertDialog(content: content);
        }
        return CupertinoAlertDialog(content: content);
      },
    );
  }

  static Future<void> showActionDialog(
    BuildContext context, {
    bool isDismissable = true,
    String? title,
    String? content,
    String? posActionTitle,
    Function()? posActionClick,
    String? negActionTitle,
    Function()? negActionClick,
  }) async {

    List<Widget>? actions =
        posActionTitle == null && negActionTitle == null ? null : [];

    if (posActionTitle != null) {
      actions?.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          if (posActionClick != null) {
            posActionClick();
          }
        },
        child: Text(
          posActionTitle,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        ),
      ));
    }

    if (negActionTitle != null) {
      actions?.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          if (negActionClick != null) {
            negActionClick();
          }
        },
        child: Text(
          negActionTitle,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        ),
      ));
    }
    showDialog(
      barrierColor: Colors.black45,
      barrierDismissible: isDismissable,
      context: context,
      builder: (context) {
        if (Platform.isAndroid) {
          return AlertDialog(
            title: title != null ? Text(title) : null,
            content: content != null ? Text(content) : null,
            actions: actions??[],
          );
        }
        return CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: content != null ? Text(content) : null,
          actions: actions ?? [],
        );
      },
    );
  }
}
