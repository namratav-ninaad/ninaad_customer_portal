import 'package:flutter/material.dart';
import 'package:ninaad_customer_portal/core/constants/app_sizes.dart';
import 'package:ninaad_customer_portal/core/constants/app_strings.dart';
import 'package:ninaad_customer_portal/core/theme/theme_color_extension.dart';
import 'package:ninaad_customer_portal/core/widgets/common_date_picker.dart';
import 'package:ninaad_customer_portal/core/widgets/common_icon_widget.dart';
import 'package:ninaad_customer_portal/core/widgets/common_text_widget.dart';
import 'package:ninaad_customer_portal/core/widgets/date_helper.dart';
import 'package:ninaad_customer_portal/features/customer/presentation/bloc/create_customer_bloc/create_customer_bloc.dart';
import 'package:ninaad_customer_portal/features/customer/presentation/bloc/create_customer_bloc/create_customer_event.dart';
import 'package:ninaad_customer_portal/features/customer/presentation/bloc/create_customer_bloc/create_customer_state.dart';

class BuildFollowUpSection extends StatelessWidget {
  const BuildFollowUpSection({
    super.key,
    required this.state,
    required this.bloc,
  });

  final CreateCustomerState state;
  final CreateCustomerBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CommonIconWidget(
        icon: Icons.calendar_today,
        color: context.black,
      ),
      title: CommonTextWidget(
        title: AppStringsConstants.selectFollowUpDate,
        fontSize: AppSizes.f14,
        fontWeight: FontWeight.w500,
        color: context.black,
      ),
      subtitle: CommonTextWidget(
        title: state.selectedNoteDate != null
            ? DateHelper.dMy(state.selectedNoteDate!.toIso8601String())
            : AppStringsConstants.noDataSelected,
        fontSize: AppSizes.f12,
        fontWeight: FontWeight.w400,
        color: context.grey89,
      ),
      onTap: () async {
        final date = await CommonDatePicker.pickDate(
          context: context,
          initialDate:
              state.selectedNoteDate ??
              DateTime.now().add(const Duration(days: 7)),
        );

        if (date != null) {
          bloc.add(SelectFollowUpDate(date: date));
        }
      },
    );
  }
}
