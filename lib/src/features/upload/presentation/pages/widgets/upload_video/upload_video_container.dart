import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ac_elevated_button/ac_elevate_button.dart';
import 'package:admin_panel/src/shared/ui_kits/ac_text_form_field/ac_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class UploadVideoContainer extends StatefulWidget {
  const UploadVideoContainer({super.key});

  @override
  State<UploadVideoContainer> createState() => _UploadVideoContainerState();
}

class _UploadVideoContainerState extends State<UploadVideoContainer> {
  ImagePicker picker = ImagePicker();
  TextEditingController videoTitle = TextEditingController();
  TextEditingController videoDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textLocalization.uploadYourVideo, style: Theme.of(context).textTheme.titleMedium,),
        Space.h8,
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async{
                            XFile? image = await picker.pickVideo(source: ImageSource.gallery);
                          },
                          child: Container(
                            width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: AppSize.s2,
                                      color: Theme.of(context).colorScheme.onSecondary
                                  ),
                                  borderRadius: BorderRadius.circular(AppSize.s12)
                              ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(IconManager.uploadFill, size: AppSize.s42, color: Theme.of(context).colorScheme.tertiary),
                                Text(textLocalization.selectVideo, style: Theme.of(context).textTheme.displayLarge,textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Space.h8,
                      ACTextFormField(controller: videoTitle, hintText: textLocalization.title),
                      Space.h8,
                      ACTextFormField(
                        controller: videoDescription,
                        hintText: textLocalization.description,
                        maxLines: 6,
                      ),
                      Space.h8,
                      ACElevatedButton(
                        onTap: () {},
                        title: textLocalization.upload,
                      )
                    ],
                  ),
                );
              },
            );
          },
          borderRadius: BorderRadius.circular(AppSize.s12),
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p12),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              border: Border.all(
                width: AppSize.s2,
                color: Theme.of(context).colorScheme.secondaryContainer
              ),
              borderRadius: BorderRadius.circular(AppSize.s12)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(IconManager.uploadFill, size: AppSize.s42, color: Theme.of(context).colorScheme.tertiary,),
                Text(textLocalization.uploadYourVideo, style: Theme.of(context).textTheme.displayLarge,),
                Space.h8,
                Text(textLocalization.acceptedFormates, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
              ],
            )
          ),
        )
      ],
    );
  }
}
