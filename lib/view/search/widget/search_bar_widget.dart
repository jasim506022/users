import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:users/res/app_string.dart';

import '../../../controller/search_controller.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_function.dart';
import '../../../res/apps_text_style.dart';

import '../../../widget/custom_text_form_field.dart';
import 'filter_dialog_widget.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var searchController = Get.find<ProductSearchController>();
    return SizedBox(
      height: 0.1.sh,
      width: 1.sw,
      child: Row(
        children: [
          Flexible(
              flex: 4,
              child: CustomTextFormField(
                style: AppsTextStyle.mediumNormalText,
                decoration: AppsFunction.inputDecoration(
                  hint: AppString.searchProductHere,
                ),
                controller: searchController.searchTextTEC,
                onChanged: (text) {
                  searchController.updateProductList(text);
                },
                hintText: '',
              )),
          IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                Get.dialog(const FilterDialogWidget());
              },
              icon: Icon(
                FontAwesomeIcons.sliders,
                color: AppColors.accentGreen,
              ))
        ],
      ),
    );
  }
}
