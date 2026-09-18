import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/customer/data/model/country.dart';
import 'package:ninaad_customer_portal/features/customer/data/repository/customer_repository.dart';

class CountryUseCase {
  final CustomerRepository repository;

  CountryUseCase(this.repository);

  Future<Either<Failure, List<CountryModel>>> call() {
    return repository.fetchCountries();
  }
}
