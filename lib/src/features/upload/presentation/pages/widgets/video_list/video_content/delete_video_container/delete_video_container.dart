import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ac_inkwell_button/ac_inkwell_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteVideoContainer extends StatelessWidget {
  const DeleteVideoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(textLocalization.deletedVideoMessage,  style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.start,),),
          Expanded(
            flex: 1,
            child: ACInkwellButton(
              backgroundColor: Theme.of(context).colorScheme.surface,
              borderColor: Theme.of(context).colorScheme.error,
              onTap: () {},
              child: Text(textLocalization.delete, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.error),),
            ),
          )
        ],
      ),
    );
  }
}
