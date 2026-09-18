import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/customer/data/model/payment_terms.dart';
import 'package:ninaad_customer_portal/features/customer/data/repository/customer_repository.dart';

class PaymentTermsUseCase {
  final CustomerRepository repository;

  PaymentTermsUseCase(this.repository);

  Future<Either<Failure, List<PaymentTermsModel>>> call() {
    return repository.fetchPaymentTerms();
  }
}
