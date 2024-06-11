import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AttachmentWidget extends StatelessWidget {
  const AttachmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${textLocalization.attachment}: ',style: Theme.of(context).textTheme.titleMedium,),
            Space.h16,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                        Center(child: SvgPicture.asset(SvgManager.pdfSvg)),
                        Space.h4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('content.pdf', style: Theme.of(context).textTheme.bodyMedium,),
                            Space.w4,
                            Icon(IconManager.download, size: AppSize.s20, color: Theme.of(context).colorScheme.secondary,),
                            Space.w4,
                            InkWell(
                              onTap: () {},
                              child: Icon(IconManager.close, size: AppSize.s16, color: Theme.of(context).colorScheme.error,),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
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
                        SvgPicture.asset(SvgManager.wordSvg),
                        Space.h4,
                        Row(
                          children: [
                            Text('content.docx', style: Theme.of(context).textTheme.bodyMedium,),
                            Space.w4,
                            Icon(IconManager.download, size: AppSize.s20, color: Theme.of(context).colorScheme.secondary,),
                            Space.w4,
                            InkWell(
                              onTap: () {},
                              child: Icon(IconManager.close, size: AppSize.s16, color: Theme.of(context).colorScheme.error,),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
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
                        SvgPicture.asset(SvgManager.powerPointSvg),
                        Space.h4,
                        Row(
                          children: [
                            Text('content.pptx', style: Theme.of(context).textTheme.bodyMedium,),
                            Space.w4,
                            Icon(IconManager.download, size: AppSize.s20, color: Theme.of(context).colorScheme.secondary,),
                            Space.w4,
                            InkWell(
                              onTap: () {},
                              child: Icon(IconManager.close, size: AppSize.s16, color: Theme.of(context).colorScheme.error,),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
