import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:users/res/app_string.dart';
import 'package:users/res/routes/routes_name.dart';
import 'package:users/view/order/widget/delivery_card_widget.dart';
import 'package:users/view/order/widget/order_item_widget.dart';

import '../../../model/order_model.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_function.dart';
import '../../../res/apps_text_style.dart';

class OrderProductDetails extends StatelessWidget {
  const OrderProductDetails({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return DelivaryCardWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${AppString.order} ${orderModel.orderId}",
                style: AppsTextStyle.largeText,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(RoutesName.orderDetailsPage,
                      arguments: orderModel);
                },
                child: Text(
                  "${AppString.orderDetails} >",
                  style: AppsTextStyle.mediumBoldText
                      .copyWith(color: AppColors.red),
                ),
              ),
            ],
          ),
          AppsFunction.verticalSpacing(25),
          Flexible(
            child: OrderItemWidget(
              orderModel: orderModel,
            ),
          ),
        ],
      ),
    );
  }
}
