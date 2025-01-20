import 'package:flutter/material.dart';
import 'package:kwiz_app/core/common/theme/pallete.dart';

void showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: Pallete.appTheme,
        content: Text(content,style: TextStyle(color: Colors.white,),),
      ),
    );
}
