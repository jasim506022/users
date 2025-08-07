import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/products_model.dart';
import '../res/app_colors.dart';
import '../res/app_function.dart';
import '../res/app_string.dart';
import '../res/apps_text_style.dart';
import 'product_image_widget.dart';

class OrderProductWidget extends StatelessWidget {
  const OrderProductWidget(
      {super.key, required this.quantity, required this.productModel});

  final int quantity;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.h,
      width: 0.9.sw,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageWidget(
            height: 95.h,
            width: 120.w,
            imageHeith: 110.h,
            productModel: productModel,
          ),
          Expanded(
            child: _buildProductDetails(productModel, context),
          )
        ],
      ),
    );
  }

  Padding _buildProductDetails(
      ProductModel productModel, BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 12.w, top: 15.h, bottom: 15.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productModel.productname!,
            style: AppsTextStyle.mediumBoldText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          AppsFunction.verticalSpacing(5),
          Row(
            children: [
              Text(productModel.productunit!.toString(),
                  style: AppsTextStyle.mediumBoldText.copyWith(
                    color: Theme.of(context).hintColor,
                  )),
            ],
          ),
          AppsFunction.verticalSpacing(5),

          /// Builds the product information section, displaying details like name, unit, and pricing.

          Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("$quantity X ",
                      style: AppsTextStyle.mediumNormalText
                          .copyWith(color: AppColors.accentGreen)),
                  Text(
                      "${AppsFunction.calculateDiscountedPrice(productModel.productprice!, productModel.discount!.toDouble())}",
                      style: AppsTextStyle.mediumNormalText
                          .copyWith(color: AppColors.accentGreen)),
                ],
              ),
              const Spacer(),
              Text(
                  "= ${AppString.currencyIcon} ${AppsFunction.calculateTotalPrice(productModel.productprice!, productModel.discount!.toDouble(), quantity)}",
                  style: AppsTextStyle.largeBoldText
                      .copyWith(color: AppColors.accentGreen)),
            ],
          ),
        ],
      ),
    );
  }
}
