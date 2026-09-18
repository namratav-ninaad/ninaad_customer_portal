import 'package:ninaad_customer_portal/core/theme/theme_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:ninaad_customer_portal/core/constants/app_sizes.dart';
import 'package:ninaad_customer_portal/core/constants/app_strings.dart';
import 'package:ninaad_customer_portal/core/widgets/common_divider.dart';
import 'package:ninaad_customer_portal/features/cart/presentation/widget/summary_row.dart';

class CartSummary extends StatelessWidget {
  final String subtotal;
  final String vat;
  final String total;

  const CartSummary({
    super.key,
    required this.subtotal,
    required this.vat,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryRow(
          label: AppStringsConstants.subtotal,
          value: subtotal.toString(),
        ),
        AppSizes.h4,
        SummaryRow(label: AppStringsConstants.vat, value: vat.toString()),
        AppSizes.h12,
        CommonDivider(),
        AppSizes.h12,
        SummaryRow(
          label: AppStringsConstants.total,
          value: total.toString(),
          textColor: context.primaryBlueColor,
          valueColor: context.primaryBlueColor,
        ),
      ],
    );
  }
}
