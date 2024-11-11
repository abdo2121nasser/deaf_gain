import 'package:deaf_gain/core/managers/values_manager.dart';
import 'package:flutter/material.dart';


class RecordingButtonWidget extends StatefulWidget {
  const RecordingButtonWidget({super.key});

  @override
  State<RecordingButtonWidget> createState() => _RecordingButtonWidgetState();
}

class _RecordingButtonWidgetState extends State<RecordingButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _sizeAnimation = Tween<double>(begin: AppVerticalSize.s50, end: AppVerticalSize.s80).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => _controller.reverse(), // Handle if user cancels the press
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.fiber_manual_record,
              color: Colors.white,
              size: AppVerticalSize.s35,
            ),
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward(); // Start the animation to increase size
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse(); // Return to the original size

  }
}