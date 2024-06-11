import 'package:admin_panel/src/features/upload/presentation/bloc/uplead_cubit.dart';
import 'package:admin_panel/src/features/upload/presentation/pages/widgets/video_list/video_content/video_player_widget/video_player_widget.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'attachment/attachment_widget.dart';
import 'comment_widget/comment_widget.dart';
import 'delete_video_container/delete_video_container.dart';
import 'description_video/description_video.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SmallScreenVideoContent extends StatelessWidget {
  const SmallScreenVideoContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(textLocalization.contentVideo, style: Theme.of(context).textTheme.displayMedium,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              child: const VideoPlayerWidget(),
            ),
            Divider(
              thickness: AppSize.s1,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: const DeleteVideoContainer()),
            Space.h16,
            SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: DescriptionVideo(title: UploadCubit.title, description: UploadCubit.description,)),
            Space.h16,
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: const AttachmentWidget(),
            ),
            Space.h16,
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: const CommentWidget()),
          ],
        ),
      ),
    );
  }
}
