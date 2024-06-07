import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteVideo extends StatelessWidget {
  const DeleteVideo({super.key});


  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(textLocalization.deletedVideoMessage, style: Theme.of(context).textTheme.bodyMedium,),
              actions: [
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Text(textLocalization.deleteVideo, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.error),),
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