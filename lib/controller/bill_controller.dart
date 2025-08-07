import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:users/model/order_model.dart';
import 'package:users/res/app_string.dart';

import '../repository/bill_repository.dart';
import '../res/app_constant.dart';
import '../res/app_function.dart';
import '../res/cart_funtion.dart';
import '../res/routes/routes_name.dart';
import 'address_controller.dart';
import 'cart_controller.dart';

class BillController extends GetxController {
  final BillRepository repository;
  //Observable variable for reactive UI Update

  var isLoading = false.obs;
  Map<String, dynamic> paymentIntentData = {};
  var currentPyamentIndex = 0.obs;
  var card = Payment.card.name.obs;
  var isSucess = false.obs;

  final CartController cartController = Get.find();
  final AddressController addressController = Get.find();

  BillController({required this.repository});

  void setLoading(bool isLoading) => this.isLoading.value = isLoading;
  void setCurrentPaymentIndex(int index) => currentPyamentIndex.value = index;
  void setCurrentPayment(String card) => this.card.value = card;

  Future<void> createPayment(String currency) async {
    try {
      setLoading(true);
      var amount = cartController.totalAmount.value.toInt();
      paymentIntentData =
          await repository.createPaymentIntent(amount.toString(), currency);

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntentData['client_secret'],
              style: ThemeMode.dark,
              merchantDisplayName: 'ANNIE'));

      await displayPaymentSheet();
    } catch (e) {
      AppsFunction.flutterToast(msg: e.toString());
    } finally {
      setLoading(false);
    }
  }

  Future<void> displayPaymentSheet() async {
    setLoading(true);
    try {
      await Stripe.instance.presentPaymentSheet();
      // paymentIntentData = {};
      paymentIntentData.clear();
      isSucess.value = true;
      if (isSucess.value) {
        _processSuccessfullPayment();
      } else {
        AppsFunction.flutterToast(msg: AppString.paymentCencle);
      }
    } on StripeException catch (e) {
      AppsFunction.flutterToast(msg: e.toString());
    } catch (e) {
      AppsFunction.flutterToast(msg: e.toString());
    } finally {
      setLoading(false);
    }
  }

  void _processSuccessfullPayment() {
    OrderModel orderModel = _buildorderModel();
    repository.uploadOrderSnapshots(
      orderModel: orderModel,
    );
    CartManager.clearCart();
    AppsFunction.flutterToast(msg: AppString.congratulationOrder);

    Get.offAllNamed(RoutesName.orderConfirmationPage);
  }

/*

  Map<String, dynamic> orderMetailsMap(String payment, double amount) {
    return {
      "addressId": addressController.addressid.value, //
      "totalamount": amount, //
      "orderBy": AppConstant.sharedPreference!
          .getString(AppString.uidSharedPreference), //
      "productIds": AppConstant.sharedPreference!
          .getStringList(AppString.cartListSharedPreference), //
      "paymentDetails": payment, //
      "orderId": orderId, //
      "seller": CartFunctions.seperateSellerSet(), //
      "orderTime": orderId, //
      "isSuccess": true, //
      "status": "normal", //
      "deliverydate": estimateDeliveryDate, //
      "deliverypartner": "BD-DEX",
      "trackingnumber": "bddex$orderId"
    };
  }

*/

  OrderModel _buildorderModel() {
    String orderId = DateTime.now().millisecondsSinceEpoch.toString();
    var amount = cartController.totalAmount.value.toInt();
    return OrderModel(
        addressId: addressController.addressid.value,
        totalAmount: amount,
        orderBy: AppConstant.sharedPreferences!
            .getString(AppString.uidSharedPreference)!,
        productIds: AppConstant.sharedPreferences!
            .getStringList(AppString.cartListSharedPreference)!,
        paymentDetails: "Payment By Carrd",
        orderId: orderId,
        seller: CartManager.getSelletSet().toList(),
        orderTime: orderId,
        isSuccess: true,
        status: "normal",
        deliveryDate: AppsFunction.estimateDeliveryDate,
        deliveryPartner: "BD-DEX",
        trackingNumber: "bddex$orderId");
  }
}
