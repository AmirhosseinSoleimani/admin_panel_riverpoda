import 'package:admin_panel/src/features/upload/presentation/pages/widgets/upload_video/upload_video_container.dart';
import 'package:admin_panel/src/features/upload/presentation/pages/widgets/video_list/video_list.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';

import 'approved_video/approved_video.dart';

class LargeWidgetUpload extends StatelessWidget {
  const LargeWidgetUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 3,
                      child: ApprovedVideo(),
                  ),
                  Expanded(
                      flex: 1,
                      child: UploadVideoContainer(),
                  ),
                ],
              ),
            ),
            Space.h16,
             const Expanded(child: VideoList()),
          ],
        ),
      ),
    );
  }
}
