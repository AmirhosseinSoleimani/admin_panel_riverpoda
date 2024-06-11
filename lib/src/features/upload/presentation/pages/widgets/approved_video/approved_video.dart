import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'approved_video_container.dart';

class ApprovedVideo extends StatelessWidget {
  const ApprovedVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${textLocalization.approvedVideo}:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Space.h8,
        Container(
          padding: const EdgeInsets.all(AppPadding.p12),
          margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            border: Border.all(
                width: AppSize.s2,
                color: Theme.of(context).colorScheme.secondaryContainer),
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                width: double.infinity,
                color: Theme.of(context).colorScheme.onSecondary,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: AppSize.s20,
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          textLocalization.title,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                          child: Text(
                        textLocalization.description,
                        style: Theme.of(context).textTheme.displayMedium,
                      )),
                    ),
                    Expanded(
                        child: Center(
                            child: Text(
                      textLocalization.publisher,
                      style: Theme.of(context).textTheme.displayMedium,
                    ))),
                    const SizedBox(
                      width: AppSize.s80,
                    ),
                  ],
                ),
              ),
              Space.h12,
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    ApprovedVideoContainer(
                        titleVideo: 'Learn Go Programming',
                        descriptionVideo:
                            'In this tutorial, you\'ll get a brief introduction to Go programming',
                        publisherVideo: 'Amirhossein',
                        datePublishVideo: '1 month age',
                        index: 1),
                    ApprovedVideoContainer(
                        titleVideo: 'Learn Go Programming',
                        descriptionVideo:
                            'In this tutorial, you\'ll get a brief introduction to Go programming',
                        publisherVideo: 'Amirhossein',
                        datePublishVideo: '1 month age',
                        index: 2),
                    ApprovedVideoContainer(
                        titleVideo: 'Learn Go Programming',
                        descriptionVideo:
                            'In this tutorial, you\'ll get a brief introduction to Go programming',
                        publisherVideo: 'Amirhossein',
                        datePublishVideo: '1 month age',
                        index: 3),
                    ApprovedVideoContainer(
                        titleVideo: 'Learn Go Programming',
                        descriptionVideo:
                            'In this tutorial, you\'ll get a brief introduction to Go programming',
                        publisherVideo: 'Amirhossein',
                        datePublishVideo: '1 month age',
                        index: 4),
                    ApprovedVideoContainer(
                        titleVideo: 'Learn Go Programming',
                        descriptionVideo:
                            'In this tutorial, you\'ll get a brief introduction to Go programming',
                        publisherVideo: 'Amirhossein',
                        datePublishVideo: '1 month age',
                        index: 5),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
