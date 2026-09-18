import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/customer/data/repository/customer_repository.dart';
import 'package:ninaad_customer_portal/features/customer/domain/entities/create_customer_data.dart';

class CreateCustomerUseCase {
  final CustomerRepository repository;

  CreateCustomerUseCase(this.repository);

  Future<Either<Failure, String>> call({required CreateCustomerData data}) {
    return repository.createCustomers(data: data);
  }
}
