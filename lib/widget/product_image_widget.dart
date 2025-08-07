import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/products_model.dart';
import '../res/app_colors.dart';
import '../view/home/widget/product_discount_widget.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    super.key,
    required this.productModel,
    required this.height,
    required this.width,
    required this.imageHeith,
  });
  final ProductModel productModel;
  final double height;
  final double width;
  final double imageHeith;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          margin: EdgeInsets.all(10.r),
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
              color: AppColors.cardBackgroundLight,
              borderRadius: BorderRadius.circular(5.r)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: FancyShimmerImage(
              height: imageHeith,
              boxFit: BoxFit.contain,
              imageUrl: productModel.productimage![0],
            ),
          ),
        ),
        ProductDiscountWidget(discount: productModel.discount!),
      ],
    );
  }
}
