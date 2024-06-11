import 'package:admin_panel/src/features/upload/presentation/bloc/uplead_cubit.dart';
import 'package:admin_panel/src/features/upload/presentation/pages/widgets/video_list/video_content/video_player_widget/video_player_widget.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';

import 'attachment/attachment_widget.dart';
import 'comment_widget/comment_widget.dart';
import 'delete_video_container/delete_video_container.dart';
import 'description_video/description_video.dart';

class LargeScreenVideoContent extends StatelessWidget {
  const LargeScreenVideoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              child: Row(
                children: [
                  const Expanded(child: VideoPlayerWidget()),
                  Space.w12,
                  Expanded(
                    child: DescriptionVideo(title: UploadCubit.title, description: UploadCubit.description,),
                  )
                ],
              ),
            ),
            Divider(
              thickness: AppSize.s1,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            Space.h16,
            const Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: CommentWidget()),
                  Space.w12,
                  Expanded(child: SizedBox(),
                  //     Column(
                  //   children: [
                  //     Expanded(
                  //       flex: 3,
                  //       child: AttachmentWidget(),
                  //     ),
                  //     Expanded(
                  //       flex: 1,
                  //       child: DeleteVideoContainer(),
                  //     ),
                  //   ],
                  // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
