import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/component/general_button_widget.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:deaf_gain/core/utils/values/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/instruction_container_widget.dart';
import '../widgets/instruction_list_widget.dart';
import '../widgets/introduction_widget.dart';
import '../widgets/translate_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: IntroductionWidget()),
        SliverToBoxAdapter(
          child: Center(
            child: SizedBox(
              width:
                  MediaQuery.of(context).size.width * 0.5, // Responsive width
              child: const TranslateButtonWidget(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: k5V,
          ),
        ),
        InstructionListWidget(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: k10V,
          ),
        ),
      ],
    );
  }
}
