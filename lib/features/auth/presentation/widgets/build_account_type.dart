import 'package:ninaad_customer_portal/core/constants/app_sizes.dart';
import 'package:ninaad_customer_portal/core/theme/theme_color_extension.dart';
import 'package:ninaad_customer_portal/core/widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

class BuildAccountType extends StatelessWidget {
  const BuildAccountType({super.key, required this.title, required this.value});

  final String title;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSizes.r12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 22,
            height: 22,
            child: Radio<bool>(
              value: value,
              activeColor: context.primaryBlueColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),

          AppSizes.w4,

          CommonTextWidget(
            title: title,
            fontSize: AppSizes.f14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
