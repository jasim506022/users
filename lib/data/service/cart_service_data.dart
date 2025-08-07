import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:users/data/service/cart_service_base.dart';
import 'package:users/res/app_string.dart';

import '../../res/cart_funtion.dart';

class CartServiceData extends CartServiceBase {
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchSellersForCart() {
    return firebaseFirestore
        .collection(AppString.firebaseSellerCollection)
        .where(AppString.firebaseuid, whereIn: CartManager.getSellerIds())
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchProductsInCartBySeller(
      {required String sellerId}) {
    return firebaseFirestore
        .collection(AppString.productCollection)
        .where("sellerId", isEqualTo: sellerId)
        .where("productId", whereIn: CartManager.getProductIds())
        .orderBy(AppString.publishDate, descending: true)
        .snapshots();

    //
  }
}
