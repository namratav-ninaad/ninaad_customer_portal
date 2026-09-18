import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/product/data/model/product.dart';
import 'package:ninaad_customer_portal/features/product/data/repository/product_repository.dart';
import 'package:ninaad_customer_portal/features/product/domain/entities/product_filter_data.dart';

class ProductUseCase {
  final ProductRepository repository;

  ProductUseCase(this.repository);

  Future<Either<Failure, List<ProductModel>>> call({
    required ProductFilterData data,
  }) {
    return repository.fetchProducts(data: data);
  }
}
