import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../loading_widget/loading_list_product_card_widget.dart';
import '../../../model/products_model.dart';
import '../../../widget/dot_line_printer.dart';

import 'cart_widget.dart';

class ProductListBySellerWidget extends StatelessWidget {
  const ProductListBySellerWidget({
    super.key,
    required this.sellerId,
  });

  final String sellerId;

  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<CartController>();
    return StreamBuilder(
      stream: cartController.fetchProductsInCartBySeller(sellerId: sellerId),
      builder: (context, snashot) {
        if (snashot.connectionState == ConnectionState.waiting) {
          return const LoadingListProudctCardWidget();
        } else if (snashot.hasData) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 1.sw,
              child: CustomPaint(
                painter: DottedLinePainter(),
              ),
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snashot.data!.docs.length,
            itemBuilder: (context, index) {
              ProductModel productModel =
                  ProductModel.fromMap(snashot.data!.docs[index].data());
              // Update the total amount after the widget is rendered

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                cartController.updateTotalAmount(productModel, index);
              });

              return CardWidget(
                productModel: productModel,
                index: index,
              );
            },
          );
        }
        return const LoadingListProudctCardWidget();
      },
    );
  }
}
