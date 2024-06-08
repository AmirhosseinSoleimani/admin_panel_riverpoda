import 'package:admin_panel/src/features/upload/presentation/pages/widgets/video_list/edit_video/video_player_widget.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../di/di_setup.dart';
import '../../../../bloc/uplead_cubit.dart';
import 'description_video.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditVideo extends StatelessWidget {
  const EditVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return BlocProvider(
        create: (BuildContext context) {
          var bloc = getIt<UploadCubit>();
          bloc.getAllContent();
          return bloc;
        },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
                child: VideoPlayerWidget(url: UploadCubit.url,),
              ),
              Divider(
                thickness: AppSize.s1,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Space.h16,
              DescriptionVideo(title: UploadCubit.title, description: UploadCubit.description,),
              Space.h16,
              Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textLocalization.comment,style: Theme.of(context).textTheme.titleMedium,),
                      Space.h16,
                      Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(AppSize.s12),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                hintText: textLocalization.addComment
                            ),
                          ),
                          commentContainer(context),
                          commentContainer(context),
                          commentContainer(context),
                          commentContainer(context),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

Widget commentContainer(BuildContext context) {
  return Column(
    children: [
      Space.h16,
      Row(
        children: [
          Container(
            width: AppSize.s28,
            height: AppSize.s28,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onSecondary
            ),
            child: const Center(child: Icon(IconManager.profile)),
          ),
          Space.w4,
          Text('@AhSoleimani', style: Theme.of(context).textTheme.bodyMedium,),
          Space.w4,
          Text('5d ago', style: Theme.of(context).textTheme.bodyMedium,)
        ],
      ),
      Space.h8,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('This is a good tutorial', style: Theme.of(context).textTheme.bodyMedium,),
          InkWell(
            onTap: () {},
            child: Icon(IconManager.delete, color: Theme.of(context).colorScheme.error, size: AppSize.s28,),
          )
        ],
      )
    ],
  );
}
