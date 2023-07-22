import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/string_manger.dart';

import '../../../../../constants/constatnts.dart';
import '../../../../view/AppCard.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    Key? key,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: h / designHeight * 50,
        ),
        Row(
          children: [
            Expanded(
                child: AppCard(
              padding: EdgeInsets.symmetric(
                  horizontal: w / designWidth * 15,
                  vertical: w / designWidth * 3),
              child: TextFormField(
                decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    hintText: StringsManger.search),
              ),
            )),
            SizedBox(
              width: w / designWidth * 16,
            ),
            AppCard(
              padding: EdgeInsets.all(w / designWidth * 2),
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