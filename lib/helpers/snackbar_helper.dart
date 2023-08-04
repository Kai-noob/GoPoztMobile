import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';

class SnackBarHelper{

  void show(BuildContext context,String label,SnackBarType snackBarType){
    
               IconSnackBar.show(context: context, label: label, snackBarType: snackBarType);
  }
}