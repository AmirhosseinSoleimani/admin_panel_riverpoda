import 'package:admin_panel/src/di/di_setup.dart';
import 'package:admin_panel/src/features/upload/presentation/bloc/uplead_cubit.dart';
import 'package:admin_panel/src/features/upload/presentation/pages/widgets/video_list/video_content/small_screen.dart';
import 'package:admin_panel/src/shared/ui_kits/responsive_widget/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'large_screen.dart';


class VideoContent extends StatelessWidget {
  const VideoContent({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) {
          var bloc = getIt<UploadCubit>();
          bloc.getAllContent();
          return bloc;
        },
      child: const ResponsiveWidget(
        smallScreen: SmallScreenVideoContent(),
        largeScreen: LargeScreenVideoContent(),
      ),
    );

  }
}
