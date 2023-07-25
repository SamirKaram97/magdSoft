import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/constants/string_manger.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';
import 'package:magdsoft_flutter_structure/presentation/view/AppContainer.dart';

import '../../../../../constants/constatnts.dart';
import '../../../../view/AppCard.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    Key? key,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: getMediaQueryHeight(context, 50) ,
        ),
        Row(
          children: [
            Expanded(
                child: AppContainer(
                  xOffset: getMediaQueryHeight(context, 2),
                  blurRadius: getMediaQueryHeight(context, 8),
                  radius: 10.sp,
                  spreadRadius: getMediaQueryHeight(context, 3),
                  yOffset: getMediaQueryHeight(context, 2),
                  child: TextFormField(
                    decoration:  InputDecoration(
                      contentPadding: EdgeInsets.all(getMediaQueryHeight(context, 15)),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 17.sp),
                        hintText: StringsManger.search),
                  ),
                )),
            SizedBox(
              width: getMediaQueryWidth(context, 16),
            ),
            AppContainer(
              xOffset: getMediaQueryHeight(context, 2),
              blurRadius: getMediaQueryHeight(context, 8),
              radius: 10.sp,
              spreadRadius: getMediaQueryHeight(context, 3),
              yOffset: getMediaQueryHeight(context, 2),
              child: IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {},
              ),
            )
          ],
        )
      ],
    );
  }
}