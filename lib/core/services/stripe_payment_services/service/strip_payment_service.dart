import 'package:deaf_gain/core/services/stripe_payment_services/service/stripe_dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../api_keys_constants/apis_constants.dart';
import '../models/payment_intent_input_model.dart';
import '../models/payment_intent_model.dart';
//note you should put this line in the main
//  Stripe.publishableKey=ApiKeysConst.stripePublishKey;
class StripPaymentService {
  static Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    Response response = await StripeDioHelper.postData(
        url: 'payment_intents',
        data: paymentIntentInputModel.toJson(),
        token: ApiKeysConst.stripeSecretKey,
        contentType: Headers.formUrlEncodedContentType);
    return PaymentIntentModel.fromJson(response.data);
  }

  static initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: 'Abdo'));
  }

  static displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  static makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    PaymentIntentModel paymentIntentModel = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret);
    await displayPaymentSheet();
  }
}
