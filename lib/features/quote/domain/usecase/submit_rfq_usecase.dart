import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/quote/data/repository/quote_repository.dart';
import 'package:ninaad_customer_portal/features/quote/domain/entity/submit_rfq_data.dart';

class SubmitRfqUseCase {
  final QuoteRepository repository;

  SubmitRfqUseCase(this.repository);

  Future<Either<Failure, String>> call({
    required SubmitRfqData data,
  }) {
    return repository.submitRfq(data: data);
  }
}