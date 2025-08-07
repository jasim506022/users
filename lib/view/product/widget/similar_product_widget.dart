import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:users/res/app_string.dart';

import '../../../model/products_model.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_function.dart';
import '../../../res/apps_text_style.dart';
import '../../../res/cart_funtion.dart';
import '../../../res/routes/routes_name.dart';
import '../../../res/network_utils.dart';

class SimilarProductWidget extends StatelessWidget {
  const SimilarProductWidget({
    super.key,
    required this.isCartBack,
    required this.productModel,
  });
  final bool isCartBack;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    bool isCart = CartManager.getProductIds().contains(productModel.productId);
    return InkWell(
      onTap: () async {
        NetworkUtils.executeWithInternetCheck(action: () {
          Get.offAndToNamed(
            RoutesName.productDetailsPage,
            arguments: {
              AppString.productModel: productModel,
              AppString.isCartBack: isCartBack
            },
          );
        });
        /*
        if (!(await NetworkUtili.verifyInternetStatus())) {
          Get.offAndToNamed(
            AppRoutesName.productDetailsPage,
            arguments: {
              AppString.productModel: productModel,
              AppString.isCartBack: isCartBack
            },
          );
        }
        */
      },
      child: Container(
        height: 150.h,
        width: 100.w,
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.only(left: 15.w),
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: FancyShimmerImage(
                height: 80.h,
                boxFit: BoxFit.fill,
                imageUrl: productModel.productimage![0],
              ),
            ),
            AppsFunction.verticalSpacing(10),
            FittedBox(
                child: Text(productModel.productname!,
                    textAlign: TextAlign.justify,
                    style: AppsTextStyle.rattingText.copyWith(
                        color: isCart
                            ? AppColors.red
                            : Theme.of(context).primaryColor))),
          ],
        ),
      ),
    );
  }
}
