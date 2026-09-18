import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/customer/data/model/state.dart';
import 'package:ninaad_customer_portal/features/customer/data/repository/customer_repository.dart';

class StateUseCase {
  final CustomerRepository repository;

  StateUseCase(this.repository);

  Future<Either<Failure, List<StateModel>>> call({required int countryId}) {
    return repository.fetchStates(countryId: countryId);
  }
}
