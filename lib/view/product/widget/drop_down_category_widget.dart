import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/apps_text_style.dart';

class DropdownCategoryWidget extends StatelessWidget {
  const DropdownCategoryWidget({
    super.key,
    this.onChanged,
    required this.value,
    required this.list,
  });
  final String value;
  final List<String> list;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1),
              borderRadius: BorderRadius.circular(15.r)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1),
              borderRadius: BorderRadius.circular(15.r)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
        ),
        value: value,
        isExpanded: true,
        style: AppsTextStyle.bodyTextStyle,
        focusColor: Theme.of(context).primaryColor,
        elevation: 16,

        /// Builds the dropdown menu items from the category list.
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: onChanged);
  }
}
