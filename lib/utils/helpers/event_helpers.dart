import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showtoast(String message){
  Fluttertoast.showToast(msg: message,gravity: ToastGravity.CENTER);
}

void showsnackbar(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),behavior: SnackBarBehavior.floating,elevation: 10,));
}