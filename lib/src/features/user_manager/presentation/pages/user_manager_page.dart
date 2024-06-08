import 'package:admin_panel/src/di/di_setup.dart';
import 'package:admin_panel/src/features/user_manager/presentation/bloc/user_manager_cubit.dart';
import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/large_widget.dart';
import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/small_widget.dart';
import 'package:admin_panel/src/shared/ui_kits/responsive_widget/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_manager_state.dart';

class UserManagerPage extends StatelessWidget {
  static const userManagerPageName = '/user-manager-page';
  const UserManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        var bloc = getIt<UserManagerCubit>();
        bloc.getAllUsers();
        return bloc;
      },
      child: BlocBuilder<UserManagerCubit, UserManagerState>(
        builder: (BuildContext context, state) {
          return const ResponsiveWidget(
            smallScreen: SmallWidgetUserManager(),
            largeScreen: LargeWidgetUserManager(),
          );
        },
      ),
    );
  }
}