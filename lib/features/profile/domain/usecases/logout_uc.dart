import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/profile/data/repository/profile_repository.dart';

class LogoutUseCase {
  final ProfileRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<Failure, String>> call() {
    return repository.logout();
  }
}
