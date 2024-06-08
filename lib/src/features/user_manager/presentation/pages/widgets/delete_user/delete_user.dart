import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/user_manager_cubit.dart';

class DeleteUser extends StatelessWidget {
  const DeleteUser({super.key, required this.id});
  final String id;


  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext _) {
            return AlertDialog(
              content: Text(textLocalization.deletedUserMessage, style: Theme.of(context).textTheme.bodyMedium,),
                actions: [
                  InkWell(
                    onTap: () {
                      context.read<UserManagerCubit>().deleteUsers(context, id);
                      context.pop();
                    },
                    child: Text(textLocalization.deleteUser, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.error),),
                  ),
                  Space.w16,
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Text(textLocalization.cancel, style: Theme.of(context).textTheme.bodyMedium,),
                  ),
                ],
            );
          },
        );
      },
      child: Icon(IconManager.delete, size: AppSize.s24, color: ColorThemeManager.redColor,),
    );
  }
}