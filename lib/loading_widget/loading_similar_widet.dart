import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:users/res/app_function.dart';

import '../res/utils.dart';

class LoadingSimilierWidget extends StatelessWidget {
  const LoadingSimilierWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: 130.h,
          width: 100.w,
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.only(left: 15.w),
          color: Theme.of(context).cardColor,
          child: Shimmer.fromColors(
            baseColor: Utils.baseShimmerColor,
            highlightColor: Utils.highlightShimmerColor,
            child: Column(
              children: [
                AppsFunction.buildShimmerEffect(height: 70),
                AppsFunction.verticalSpacing(8),
                AppsFunction.buildShimmerEffect(height: 10)
              ],
            ),
          ),
        );
      },
    );
  }
}
