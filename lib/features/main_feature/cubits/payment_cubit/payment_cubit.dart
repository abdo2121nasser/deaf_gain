import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/stripe_payment_services/models/payment_intent_input_model.dart';
import '../../../../core/services/stripe_payment_services/service/strip_payment_service.dart';

// import '../../../../core/services/stripe_payment_services/models/payment_intent_input_model.dart';
// import '../../../../core/services/stripe_payment_services/service/strip_payment_service.dart';
//

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);

  makeStripePayment({required int amount}) async {
    try {
      emit(MakeStripePaymentLoadingState());
    await  StripPaymentService.makePayment(
          paymentIntentInputModel: PaymentIntentInputModel(
              amount: amount.toString(), currency: 'USD'));
      emit(MakeStripePaymentSuccessState());
    } catch (error) {
      emit(MakeStripePaymentErrorState());
      debugPrint(error.toString());
    }
  }
}
