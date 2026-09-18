import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/product/data/model/category.dart';
import 'package:ninaad_customer_portal/features/product/data/repository/product_repository.dart';

class CategoryUseCase {
  final ProductRepository repository;

  CategoryUseCase(this.repository);

  Future<Either<Failure, List<CategoryModel>>> call() {
    return repository.fetchCategories();
  }
}