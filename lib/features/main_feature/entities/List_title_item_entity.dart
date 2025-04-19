import 'package:flutter/cupertino.dart';

class ListTitleItemEntity{

  final String text;
  final IconData iconData;
  final VoidCallback onClick;

  ListTitleItemEntity({required this.text, required this.iconData,required this.onClick});

}