import 'package:dio/dio.dart';
import 'package:ninaad_customer_portal/core/constants/app_strings.dart';
import 'package:ninaad_customer_portal/core/error/exception.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/core/model/common_response.dart';
import 'package:ninaad_customer_portal/features/quote/domain/entity/submit_rfq_data.dart';

abstract class QuoteRemoteDataSource {
  Future<String> submitRfq({required SubmitRfqData data});
}

class QuoteRemoteDataSourceImpl implements QuoteRemoteDataSource {
  final Dio dio;

  QuoteRemoteDataSourceImpl(this.dio);

  @override
  Future<String> submitRfq({required SubmitRfqData data}) async {
    try {
      final response = await dio.post(
        AppStringsConstants.submitRfqURl,
        data: data.toMap(),
      );

      return CommonResponse.fromJson(response.data, (json) => json).message;
    } on DioException catch (e) {
      throw ServerException(getErrorMessage(e));
    }
  }
}
