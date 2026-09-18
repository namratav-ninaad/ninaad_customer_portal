import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/customer/data/model/customer.dart';
import 'package:ninaad_customer_portal/features/customer/data/repository/customer_repository.dart';
import 'package:ninaad_customer_portal/features/customer/domain/entities/customer_filter_data.dart';

class CustomerUseCase {
  final CustomerRepository repository;

  CustomerUseCase(this.repository);

  Future<Either<Failure, List<CustomerModel>>> call({required CustomerFilterData data}) {
    return repository.fetchCustomers(data: data);
  }
}
