import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/customer/data/model/company.dart';
import 'package:ninaad_customer_portal/features/customer/data/repository/customer_repository.dart';

class CompanyUseCase {
  final CustomerRepository repository;

  CompanyUseCase(this.repository);

  Future<Either<Failure, List<CompanyModel>>> call() {
    return repository.fetchCompanies();
  }
}
