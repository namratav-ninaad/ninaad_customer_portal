import 'package:dartz/dartz.dart';
import 'package:ninaad_customer_portal/core/error/failures.dart';
import 'package:ninaad_customer_portal/features/cart/data/model/cart.dart';
import 'package:ninaad_customer_portal/features/cart/data/repository/cart_repository.dart';

class CartUseCase {
  final CartRepository repository;

  CartUseCase(this.repository);

  Future<Either<Failure, CartModel>> call() {
    return repository.fetchCart();
  }
}
