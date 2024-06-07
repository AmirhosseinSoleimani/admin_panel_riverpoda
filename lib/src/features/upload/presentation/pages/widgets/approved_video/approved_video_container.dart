import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';

class ApprovedVideoContainer extends StatelessWidget {
  const ApprovedVideoContainer({super.key, required this.titleVideo, required this.descriptionVideo, required this.publisherVideo, required this.datePublishVideo, required this.index});
  final int index;
  final String titleVideo;
  final String descriptionVideo;
  final String publisherVideo;
  final String datePublishVideo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: AppSize.s28,
              child: Row(
                children: [
                  SizedBox(
                    width: AppSize.s18,
                    child: Text('$index', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.start,),
                  ),
                  Space.w4,
                  VerticalDivider(
                    thickness: AppSize.s1,
                    width: AppSize.s1,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  Space.w4,
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Center(child: Text(titleVideo, style: Theme.of(context).textTheme.bodyMedium,))),
            Expanded(
              flex: 3,
              child: Center(child: Text(descriptionVideo, style: Theme.of(context).textTheme.bodyMedium)),
            ),
            Expanded(child: Center(child: Text(publisherVideo, style: Theme.of(context).textTheme.bodyMedium))),
            Expanded(child: Center(child: Text(datePublishVideo, style: Theme.of(context).textTheme.bodyMedium))),
            SizedBox(
              width: AppSize.s48,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(IconManager.check, size: AppSize.s24, color: ColorThemeManager.green,),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(IconManager.close, size: AppSize.s24, color: ColorThemeManager.redColor,),
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
