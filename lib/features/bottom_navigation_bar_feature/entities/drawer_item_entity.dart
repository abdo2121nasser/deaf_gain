import 'package:flutter/cupertino.dart';

class DrawerItemEntity{

  final String text;
  final IconData iconData;
  final VoidCallback onClick;

  DrawerItemEntity({required this.text, required this.iconData,required this.onClick});

}