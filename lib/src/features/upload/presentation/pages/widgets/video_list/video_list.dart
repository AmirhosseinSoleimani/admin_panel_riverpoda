import 'package:admin_panel/src/features/upload/presentation/pages/widgets/video_list/video_list_container.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${textLocalization.videoList}:', style: Theme.of(context).textTheme.titleMedium,),
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
                      child: Text(textLocalization.title, style: Theme.of(context).textTheme.displayMedium,),
                  ),
              ),
              Expanded(
                  flex: 3,
                  child: Center(child: Text(textLocalization.description, style: Theme.of(context).textTheme.displayMedium,)),
              ),
              Expanded(child: Center(child: Text(textLocalization.publisher, style: Theme.of(context).textTheme.displayMedium,))),
              Expanded(child: Center(child: Text(textLocalization.publisherDate, style: Theme.of(context).textTheme.displayMedium,))),
              const SizedBox(
                width: AppSize.s48,
              ),
            ],
          ),
        ),
        Space.h12,
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView(
            children: const [
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 1),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 2),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 3),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 4),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 5),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 6),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 7),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 8),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 9),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 10),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 11),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 12),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 13),
              VideoListContainer(titleVideo: 'Learn Go Programming', descriptionVideo: 'In this tutorial, you\'ll get a brief introduction to Go programming', publisherVideo: 'Amirhossein', datePublishVideo: '1 month age', index: 14),

            ],
          ),
        )
      ],
    );
  }
}
