import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../constants.dart';
import 'stripe_keys.dart';
import '../../../features/checkout/presentation/views/payment_view.dart';

abstract class PaymentManager {
  static Map<String, dynamic>? paymentIntentData;

  static Future<void> makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
      _handlePaymentSuccess();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Fruits Hub",
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${StripeKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    // if (response.statusCode == 200) {
    //   return response.data["client_secret"];
    // }
    paymentIntentData = response.data;
    return response.data["client_secret"];
  }

  static void _handlePaymentSuccess() {
    try {
      // Call your backend to confirm the payment status if needed
      // Here we directly assume the payment is successful

      // Save the payment data to Firebase Firestore
      FirebaseFirestore.instance.collection('orders').add({
        'order_id': paymentIntentData!['id'],
        'amount': paymentIntentData!['amount'],
        'currency': paymentIntentData!['currency'],
        'status': 'success',
        'created_at': FieldValue.serverTimestamp(),
      });

      // Navigate to the confirmation page
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => PaymentView(),
        ),
      );
    } catch (e) {
      print('Failed to add order: $e');
    }
  }
}
