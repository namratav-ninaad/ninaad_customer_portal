import 'package:ninaad_customer_portal/core/enum/app_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninaad_customer_portal/features/auth/domain/usecases/auth_usecase.dart';
import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;

  ForgotPasswordBloc({required this.forgotPasswordUseCase})
    : super(const ForgotPasswordState()) {
    on<SendOtpSubmitted>(_sendOtp);
  }

  Future<void> _sendOtp(
    SendOtpSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(state: ApiStatus.loading, errorMessage: null));

    final result = await forgotPasswordUseCase(email: event.email);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            state: ApiStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (message) {
        emit(state.copyWith(state: ApiStatus.success));
      },
    );
  }
}
