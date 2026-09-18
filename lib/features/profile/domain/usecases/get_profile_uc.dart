import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/profile/data/model/profile_model.dart';
import 'package:ninaad_customer_portal/features/profile/data/repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<Either<Failure, ProfileModel>> call() {
    return repository.getProfile();
  }
}
