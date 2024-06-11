import 'package:admin_panel/src/features/upload/presentation/bloc/uplead_cubit.dart';
import 'package:admin_panel/src/features/upload/presentation/pages/widgets/video_list/video_content/attachment/attachment_widget.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ui_kits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DescriptionVideo extends StatefulWidget {
  const DescriptionVideo({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  State<DescriptionVideo> createState() => _DescriptionVideoState();
}

class _DescriptionVideoState extends State<DescriptionVideo> {
  TextEditingController videoTitle = TextEditingController();
  TextEditingController videoDescription = TextEditingController();

  @override
  void initState() {
    videoTitle.text = widget.title;
    videoDescription.text = widget.description;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: ListView(
        shrinkWrap: true,
        children: [
          ACTextFormField(controller: videoTitle, hintText: textLocalization.title),
          Space.h16,
          ACTextFormField(controller: videoDescription, hintText: textLocalization.description, maxLines: 4,),
          Space.h16,
          Row(
            children: [
              Text('${textLocalization.views}: ', style: Theme.of(context).textTheme.displayMedium,),
              Text('12', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface),),
            ],
          ),
          Space.h12,
          Row(
            children: [
            Text('${textLocalization.publisher}: ', style: Theme.of(context).textTheme.displayMedium,),
            Text(UploadCubit.authorName, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface),),
            ],
          ),
          Space.h12,
          Row(
            children: [
              Text('${textLocalization.date}: ', style: Theme.of(context).textTheme.displayMedium,),
              Text('${UploadCubit.publishDate.substring(0, 10)} --- ${UploadCubit.publishDate.substring(12, 19)}', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface),),
            ],
          ),

          Space.h16,
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  flex: 3,
                  child: AttachmentWidget(),
              ),
              Space.w8,
              Expanded(
                flex: 2,
                child: SizedBox()
              ),
            ],
          ),
          Space.h16,
          Row(
            children: [
              const Expanded(
                  flex: 1,
                  child: SizedBox()
              ),
              Expanded(
                child: ACInkwellButton(
                  backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                  onTap: () {
                    context.read<UploadCubit>().updateContent(videoTitle.text, videoDescription.text);
                  },
                  title: textLocalization.save,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Space.w8,
              Expanded(
                child: ACInkwellButton(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  borderColor: Theme.of(context).colorScheme.error,
                  onTap: () {},
                  child: Text(textLocalization.delete, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.error),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}