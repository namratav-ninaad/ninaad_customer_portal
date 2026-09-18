import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/customer/data/model/contact_tag.dart';
import 'package:ninaad_customer_portal/features/customer/data/repository/customer_repository.dart';

class ContactTagUseCase {
  final CustomerRepository repository;

  ContactTagUseCase(this.repository);

  Future<Either<Failure, List<ContactTagModel>>> call() {
    return repository.fetchContactTags();
  }
}
