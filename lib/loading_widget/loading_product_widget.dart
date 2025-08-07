import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../res/app_function.dart';
import '../res/utils.dart';

class LoadingProductWidget extends StatelessWidget {
  const LoadingProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        color: Theme.of(context).cardColor,
        height: 1.sh,
        width: 1.sw,
        child: Shimmer.fromColors(
          baseColor: Utils.baseShimmerColor,
          highlightColor: Utils.highlightShimmerColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppsFunction.buildShimmerEffect(height: 135),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppsFunction.buildShimmerEffect(height: 15),
                      AppsFunction.verticalSpacing(8),
                      AppsFunction.buildShimmerEffect(height: 15),
                      AppsFunction.verticalSpacing(8),
                      AppsFunction.buildShimmerEffect(height: 15),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
