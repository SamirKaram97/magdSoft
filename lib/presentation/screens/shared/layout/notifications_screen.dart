import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/layout_cubit/layout_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/layout_cubit/layout_state.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return const Center(
          child: Text("Notifications Screen"),
        );
      },
    );
  }
}
