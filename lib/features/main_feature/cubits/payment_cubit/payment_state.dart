part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class MakeStripePaymentLoadingState extends PaymentState {}
final class MakeStripePaymentSuccessState extends PaymentState {}
final class MakeStripePaymentErrorState extends PaymentState {}
