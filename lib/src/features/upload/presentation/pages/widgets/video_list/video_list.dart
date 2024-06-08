import 'package:admin_panel/src/features/upload/presentation/bloc/uplead_cubit.dart';
import 'package:admin_panel/src/features/upload/presentation/bloc/upload_state.dart';
import 'package:admin_panel/src/features/upload/presentation/pages/widgets/video_list/video_list_container.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../di/di_setup.dart';
import '../../../../../../shared/ui_kits/ac_loading/ac_loading.dart';


class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return BlocProvider(
        create: (BuildContext context) {
          var bloc = getIt<UploadCubit>();
          bloc.getAllContent();
          return bloc;
      },
      child: Column(
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
          BlocBuilder<UploadCubit, UploadState>(
            builder: (BuildContext context, state) {
              return state.whenOrNull(
                loading: () => const ACLoading(),
                success: () {
                  return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.builder(
                      itemCount: context.read<UploadCubit>().listAllContents.length,
                      itemBuilder: (BuildContext context, int index) {
                        return VideoListContainer(
                            titleVideo: context.read<UploadCubit>().listAllContents[index].title!,
                            descriptionVideo: context.read<UploadCubit>().listAllContents[index].title!,
                            publisherVideo: context.read<UploadCubit>().listAllContents[index].authorName!,
                            datePublishVideo: context.read<UploadCubit>().listAllContents[index].createdAt!,
                            index: index,
                            url: context.read<UploadCubit>().listAllContents[index].url!,
                          id: context.read<UploadCubit>().listAllContents[index].id!.toString(),);
                      },
                    ),
                  );
                }
              ) ?? const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
