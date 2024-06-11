import 'package:admin_panel/src/features/upload/presentation/bloc/uplead_cubit.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ac_loading/ac_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../delete_video.dart';

class VideoListContainer extends StatelessWidget {
  const VideoListContainer({super.key, required this.titleVideo, required this.descriptionVideo, required this.publisherVideo, required this.datePublishVideo, required this.index, required this.url, required this.id, required this.imageUrl});
  final int index;
  final String titleVideo;
  final String descriptionVideo;
  final String publisherVideo;
  final String datePublishVideo;
  final String url;
  final String id;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: AppSize.s28,
              child: Row(
                children: [
                  SizedBox(
                      width: AppSize.s18,
                      child: Text('$index', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.start,),
                  ),
                  Space.w4,
                  VerticalDivider(
                    thickness: AppSize.s1,
                    width: AppSize.s1,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  Space.w4,
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: CachedNetworkImage(
                          width: AppSize.s120,
                          height: AppSize.s60,
                          fit: BoxFit.contain,
                          imageUrl: "http://172.16.251.80$imageUrl",
                          placeholder: (context, url) => const ACLoading(),
                          errorWidget: (context, url, error) => Center(child: Icon(IconManager.error, color: Theme.of(context).colorScheme.secondary, size: AppSize.s24,)),
                        ),),
                    Expanded(
                        child: Center(child: Text(titleVideo, style: Theme.of(context).textTheme.bodyMedium,))),
                    Expanded(
                      flex: 2,
                      child: Center(child: Text(descriptionVideo, style: Theme.of(context).textTheme.bodyMedium)),
                    ),
                    Expanded(child: Center(child: Text(publisherVideo, style: Theme.of(context).textTheme.bodyMedium))),
                    Expanded(child: Center(child: Text('${datePublishVideo.substring(0,10)} --- ${datePublishVideo.substring(11,19)}',
                        style: Theme.of(context).textTheme.bodyMedium))),
                    SizedBox(
                      width: AppSize.s48,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              UploadCubit.title = titleVideo;
                              UploadCubit.url = url;
                              UploadCubit.description = descriptionVideo;
                              UploadCubit.id = id;
                              UploadCubit.publishDate = datePublishVideo;
                              UploadCubit.authorName = publisherVideo;
                              context.goNamed('/edit-content');
                            },
                            child: Icon(IconManager.pen, size: AppSize.s24, color: ColorThemeManager.primary,),
                          ),
                          const DeleteVideo(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
