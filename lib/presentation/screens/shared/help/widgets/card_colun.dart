import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../business_logic/help_bloc/bloc.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../../data/models/HelpModel.dart';
import '../../../../styles/colors.dart';

class CardColumn extends StatelessWidget {
  const CardColumn({
    Key? key,
    required this.helpModelList,
    required this.index,
  }) : super(key: key);

  final List<HelpModel> helpModelList;
  final int index;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
  var bloc=BlocProvider.of<HelpBloc>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(helpModelList[index].question??"",style: Theme.of(context).textTheme.labelMedium),
            const Spacer(),
            IconButton(onPressed: () {
              bloc.changeSelectedIndex(index);

            }, icon:  Icon(index==bloc.selectedIndex?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down)),
          ],
        ),
        Flex(direction: Axis.vertical,children: [
          if(index==bloc.selectedIndex)Text(helpModelList[index].answer??"",style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.black))
        ],)
      ],
    );
  }
}