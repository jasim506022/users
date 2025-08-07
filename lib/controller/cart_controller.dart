import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

import '../model/app_exception.dart';
import '../model/products_model.dart';
import '../repository/cart_repository.dart';
import '../res/app_asset/icon_asset.dart';
import '../res/app_constant.dart';
import '../res/app_function.dart';
import '../res/app_string.dart';
import '../res/cart_funtion.dart';

import '../widget/error_dialog_widget.dart';
import 'profile_controller.dart';

class CartController extends GetxController {
  CartRepository repository;

  var profileController = Get.find<ProfileController>();

  CartController({required this.repository});

  // Observable variables
  var cartItemCounter = 0.obs;
  var totalAmount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    initializeCartItemCount();
  }

  void initializeCartItemCount() {
    final cartList = AppConstant.sharedPreferences
        ?.getStringList(AppString.cartListSharedPreference);
    if (cartList != null && cartList.isNotEmpty) {
      cartItemCounter.value = cartList.length - 1;
    }
  }

  int get itemCount => cartItemCounter.value;

  void incrementCartItem() {
    cartItemCounter.value++;
  }

  void decrementCartItem() {
    if (cartItemCounter.value > 0) {
      cartItemCounter.value--;
    }
  }

  void updateTotalAmount(ProductModel productModel, int itemIndex) {
    /*

    totalAmount.value += ((AppsFunction.productPrice(
          productModel.productprice!,
          productModel.discount!.toDouble(),
        ) *
        CartFunctions.seperateProductQuantiyList()[itemIndex]));
*/
    final productPrice = AppsFunction.calculateDiscountedPrice(
      productModel.productprice!,
      productModel.discount!.toDouble(),
    );
    final quantity = CartManager.getProductQuantities()[itemIndex];
    totalAmount.value += productPrice * quantity;
  }

  void removeValue(double productPrice) {
    totalAmount.value -= productPrice;
  }

  void resetTotalAmount() {
    totalAmount = 0.0.obs;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchSellersForCart() {
    try {
      return repository.fetchSellersForCart();
    } catch (e) {
      if (e is AppException) {
        _handleError(e);

        if (cartItemCounter.value == 1) {
          Get.back();
        }
      }
      rethrow;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchProductsInCartBySeller(
      {required String sellerId}) {
    try {
      return repository.fetchProductsInCartBySeller(sellerId: sellerId);
    } catch (e) {
      if (e is AppException) {
        _handleError(e);
      }
      rethrow;
    }

    //
  }

  void _handleError(AppException e) {
    Get.dialog(
      ErrorDialogWidget(
        icon: AppIcons.warningIconPath,
        title: "e.title!",
        content: e.message,
        buttonText: AppString.okay,
      ),
    );

    // AppsFunction.errorDialog(
    //   icon: AppIcons.warningIcon,
    //   title: e.title ?? AppString.errorOccure,
    //   content: e.message ?? AppString.someThingWentWrong,
    //   buttonText: AppString.okay,
    // );
  }

  Future<void> removeProductFromCart({required String productId}) async {
    // print(cartItemCounter.value);
    List<String> cartList = AppConstant.sharedPreferences!
        .getStringList(AppString.cartListSharedPreference)!;

    String itemToRemove = cartList.firstWhere(
      (element) => element.contains(productId),
      orElse: () => '',
    );

    if (itemToRemove.isNotEmpty) {
      cartList.remove(itemToRemove);

      try {
        profileController.updateusersCartData(
            map: {AppString.cartListSharedPreference: cartList});

        AppsFunction.flutterToast(msg: AppString.itemRemoveSuccessfully);

        AppConstant.sharedPreferences!
            .setStringList(AppString.cartListSharedPreference, cartList);

        CartManager.getProductIds();
        CartManager.getProductQuantities();

        --cartItemCounter;
        if (cartItemCounter.value != 0) {
          fetchSellersForCart();
        }
      } catch (e) {
        AppsFunction.flutterToast(msg: e.toString());
      }
    } else {
      AppsFunction.flutterToast(msg: AppString.itemNotFoundInCart);
    }
  }
}
