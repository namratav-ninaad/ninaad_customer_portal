import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/profile/data/repository/profile_repository.dart';
import 'package:ninaad_customer_portal/features/profile/domain/entities/update_profile_data.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, String>> call({required UpdateProfileData data}) {
    return repository.updateProfile(data: data);
  }
}
