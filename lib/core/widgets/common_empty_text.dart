import 'package:ninaad_customer_portal/core/constants/app_sizes.dart';
import 'package:ninaad_customer_portal/core/theme/theme_color_extension.dart';
import 'package:ninaad_customer_portal/core/widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

class CommonEmptyText extends StatelessWidget {
  const CommonEmptyText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CommonTextWidget(
        title: title,
        fontSize: AppSizes.f16,
        fontWeight: FontWeight.w700,
        color: context.black,
      ),
    );
  }
}
