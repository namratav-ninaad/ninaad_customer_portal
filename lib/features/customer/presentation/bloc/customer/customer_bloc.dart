// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ninaad_customer_portal/core/enum/app_enum.dart';
import 'package:ninaad_customer_portal/features/customer/domain/entities/customer_filter_data.dart';
import 'package:ninaad_customer_portal/features/customer/domain/usecases/customer_uc.dart';

import 'customer_event.dart';
import 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerUseCase customerUseCase;

  CustomerBloc({required this.customerUseCase}) : super(CustomerState()) {
    on<FetchCustomerEvent>(_onFetchCustomer);
  }

  Future<void> _onFetchCustomer(
    FetchCustomerEvent event,
    Emitter<CustomerState> emit,
  ) async {
    emit(state.copyWith(state: ApiStatus.loading, errorMessage: null));

    final result = await customerUseCase.call(
      data: CustomerFilterData(search: event.search.toLowerCase().trim()),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(state: ApiStatus.failure, errorMessage: failure.message),
      ),
      (customers) =>
          emit(state.copyWith(state: ApiStatus.success, customers: customers)),
    );
  }
}
