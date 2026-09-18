import 'package:ninaad_customer_portal/core/enum/app_enum.dart';

class OrderData {
  final bool backButtonShow;
  final OrderStatus? status;
  final int? partnerId;

  OrderData({this.backButtonShow = false, this.status, this.partnerId});
}
