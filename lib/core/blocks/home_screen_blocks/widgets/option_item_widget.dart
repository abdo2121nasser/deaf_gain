import 'package:flutter/material.dart';


class OptionItemWidget extends StatelessWidget {
  final IconData icon;
  const OptionItemWidget({
    super.key,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.maybeOf(context)!.size.width*0.3,
      height: MediaQuery.maybeOf(context)!.size.height*0.18,
      decoration:
      const BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
      child: Icon(
        icon,
        color: Colors.white,
        size: MediaQuery.maybeOf(context)!.size.height*0.1,
      ),
    );
  }
}
