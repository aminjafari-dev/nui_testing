import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  Future init() async {
    // Set the publishable key for Stripe - this is mandatory
    Stripe.publishableKey = '';
  }

  Future applySettings() async {
    // Apply any settings for Stripe
    await Stripe.instance.applySettings();
  }

  Future canAddCardToWallet(CanAddCardToWalletParams param) async {
    // Check if a card can be added to the wallet (Google Pay or Apple Pay)
    return await Stripe.instance.canAddCardToWallet(param);
  }

  Future collectBankAccount({
    required bool isPaymentIntent,
    required String clientSecret,
    required CollectBankAccountParams params,
  }) async {
    // Collect bank account details for the customer
    await Stripe.instance.collectBankAccount(
        isPaymentIntent: isPaymentIntent,
        clientSecret: clientSecret,
        params: params);
  }

  Future collectBankAccountToken({required String clientSecret}) async {
    // Collect a token for a bank account for future use
    await Stripe.instance.collectBankAccountToken(clientSecret: clientSecret);
  }

  Future createApplePayToken(Map<String, dynamic> payment) async {
    // Create a token using Apple Pay
    await Stripe.instance.createApplePayToken(payment);
  }

  Future confirmPayment({
    required String paymentIntentClientSecret,
    PaymentMethodParams? data,
    PaymentMethodOptions? options,
  }) async {
    // Confirm the payment intent with provided parameters
    await Stripe.instance.confirmPayment(
      paymentIntentClientSecret: paymentIntentClientSecret,
      data: data,
      options: options,
    );
  }

  Future verifyPaymentIntentWithMicrodeposits({
    required bool isPaymentIntent,
    required String clientSecret,
    required VerifyMicroDepositsParams params,
  }) async {
    // Verify payment intent with micro-deposits (bank account verification)
    await Stripe.instance.verifyPaymentIntentWithMicrodeposits(
      isPaymentIntent: isPaymentIntent,
      clientSecret: clientSecret,
      params: params,
    );
  }

  Future initCustomerSheet(
      {required CustomerSheetInitParams customerSheetInitParams}) async {
    // Initialize the Customer Sheet for saved payment methods
    await Stripe.instance
        .initCustomerSheet(customerSheetInitParams: customerSheetInitParams);
  }

  Future presentCustomerSheet() async {
    // Present the Customer Sheet for the customer to select a saved payment method
    await Stripe.instance.presentCustomerSheet();
  }

  Future retrievePaymentIntent(String clientSecret) async {
    // Retrieve the Payment Intent by client secret
    return await Stripe.instance.retrievePaymentIntent(clientSecret);
  }

  Future createToken(CreateTokenParams params) async {
    // Create a token for card or bank account
    return await Stripe.instance.createToken(params);
  }

  Future confirmSetupIntent({
    required String setupIntentClientSecret,
    required PaymentMethodParams params,
  }) async {
    // Confirm a Setup Intent for future payment methods
    await Stripe.instance.confirmSetupIntent(
      paymentIntentClientSecret: setupIntentClientSecret,
      params: params,
    );
  }

  Future handleNextAction(String clientSecret) async {
    // Handle the next action required for a Payment Intent or Setup Intent
    await Stripe.instance.handleNextAction(clientSecret);
  }

  Future isPlatformPaySupported() async {
    // Check if platform-specific payments (Google Pay/Apple Pay) are supported
    return await Stripe.instance.isPlatformPaySupported();
  }

  Future presentPaymentSheet1({
    required PaymentSheetPresentOptions params,
  }) async {
    // Present the platform pay sheet (Google Pay/Apple Pay) to the user
    await Stripe.instance.presentPaymentSheet(options: params);
  }

  Future confirmPlatformPay({
    required String paymentIntentClientSecret,
    PaymentMethodParams? data,
    PaymentMethodOptions? options,
  }) async {
    // Confirm payment via platform pay (Google Pay/Apple Pay)
    await Stripe.instance
        .confirmPayment(paymentIntentClientSecret: paymentIntentClientSecret);
  }

  // Future createGooglePayToken(Map<String, dynamic> payment) async {
  //   // Create a token using Google Pay
  //   await Stripe.instance.google(payment);
  // }

  Future<dynamic> presentPaymentSheet() async {
    // Present a pre-built Stripe payment sheet for handling payments
    return await Stripe.instance.presentPaymentSheet();
  }

  Future initPaymentSheet({
    required SetupPaymentSheetParameters paymentSheetParameters,
  }) async {
    // Initialize the payment sheet with required parameters
    await Stripe.instance
        .initPaymentSheet(paymentSheetParameters: paymentSheetParameters);
  }

  Future createPaymentMethod(PaymentMethodParams params) async {
    // Create a new payment method (card, bank account, etc.)
    return await Stripe.instance.createPaymentMethod(params: params);
  }

  Future<void> retrieveSetupIntent(String clientSecret) async {
    // Retrieve a Setup Intent
    await Stripe.instance.retrieveSetupIntent(clientSecret);
  }
}
