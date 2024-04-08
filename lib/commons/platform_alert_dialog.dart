//import 'dart:io';

//import 'package:firebase_auth_demo_flutter/constants/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'platform_widget.dart';

class PlatformAlertDialog extends PlatformWidget {
  PlatformAlertDialog({
    this.title,
    this.content,
    this.cancelActionText,
    this.defaultActionText,
  });
  @required
  final String? title;
  @required
  final String? content;
  final String? cancelActionText;
  @required
  final String? defaultActionText;

  Future<bool?> show(BuildContext context) async {
    // return Platform.isIOS
    //     ? await showCupertinoDialog<bool>(
    //         context: context,
    //         builder: (BuildContext context) => this,
    //       )
    //     :
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => this,
    );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title!),
      content: Text(content!),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      content: Text(content!),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final List<Widget> actions = <Widget>[];
    if (cancelActionText != null) {
      actions.add(
        PlatformAlertDialogAction(
          child: Text(
            cancelActionText!,
            //key: Key(Keys.alertCancel),
          ),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      );
    }
    actions.add(
      PlatformAlertDialogAction(
        child: Text(
          defaultActionText!,
          // key: Key(Keys.alertDefault),
        ),
        onPressed: () => Navigator.of(context).pop(true),
      ),
    );
    return actions;
  }
}

class PlatformAlertDialogAction extends PlatformWidget {
  PlatformAlertDialogAction({this.child, this.onPressed});
  final Widget? child;
  final VoidCallback? onPressed;

  // @override
  // Widget buildCupertinoWidget(BuildContext context) {
  //   return CupertinoDialogAction(
  //     child: child,
  //     onPressed: onPressed,
  //   );
  // }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child!,
      onPressed: onPressed,
    );
  }
}
