import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';


class UploadVideoContainer extends StatefulWidget {
  const UploadVideoContainer({super.key});

  @override
  State<UploadVideoContainer> createState() => _UploadVideoContainerState();
}

class _UploadVideoContainerState extends State<UploadVideoContainer> {

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${textLocalization.uploadYourVideo}:', style: Theme.of(context).textTheme.titleMedium,),
        Space.h8,
        InkWell(
          onTap: () {
            context.pushNamed('/upload-video');
          },
          borderRadius: BorderRadius.circular(AppSize.s12),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            padding: const EdgeInsets.all(AppPadding.p12),
            margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
            decoration: BoxDecoration(
              border: Border.all(
                width: AppSize.s2,
                color: Theme.of(context).colorScheme.secondaryContainer
              ),
              borderRadius: BorderRadius.circular(AppSize.s12)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(IconManager.uploadFill, size: AppSize.s42, color: Theme.of(context).colorScheme.tertiary,),
                Text(textLocalization.uploadYourVideo, style: Theme.of(context).textTheme.displayLarge,),
                Space.h8,
                Text(textLocalization.acceptedFormates, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary), textAlign: TextAlign.center,),
              ],
            )
          ),
        )
      ],
    );
  }
}
