import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'comment_container.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        child: ListView(
          children: [
            Text(textLocalization.comment,style: Theme.of(context).textTheme.titleMedium,),
            Space.h16,
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  hintText: textLocalization.addComment
              ),
            ),
            const CommentContainer(),
            const CommentContainer(),
            const CommentContainer(),
            const CommentContainer(),
            const CommentContainer()
          ],
        ),
      ),
    );
  }
}
