import 'package:admin_panel/src/features/upload/presentation/pages/widgets/upload_video/upload_video_container.dart';
import 'package:admin_panel/src/features/upload/presentation/pages/widgets/video_list/video_list.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';

import 'approved_video/approved_video.dart';

class SmallWidgetUpload extends StatelessWidget {
  const SmallWidgetUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              ApprovedVideo(),
              Space.h16,
              VideoList(),
              Space.h16,
              UploadVideoContainer(),
              Space.h64,
            ],
          ),
        ),
      ),
    );
  }
}
