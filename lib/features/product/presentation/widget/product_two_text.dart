import 'package:flutter/material.dart';
import 'package:ninaad_customer_portal/core/constants/app_sizes.dart';
import 'package:ninaad_customer_portal/core/constants/app_strings.dart';
import 'package:ninaad_customer_portal/core/theme/theme_color_extension.dart';
import 'package:ninaad_customer_portal/core/widgets/common_text_widget.dart';

class ProductTwoText extends StatelessWidget {
  const ProductTwoText({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.p6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CommonTextWidget(
              title: '$title\t${AppStringsConstants.colon}',
              fontSize: AppSizes.f14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: CommonTextWidget(
              title: value,
              fontSize: AppSizes.f12,
              color: context.grey89,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
