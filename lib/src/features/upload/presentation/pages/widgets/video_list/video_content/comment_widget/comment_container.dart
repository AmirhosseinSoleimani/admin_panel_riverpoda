import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Spacer(),
            Text('5d ago', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        Space.h8,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          child: Row(
            children: [
              Text('This is a good tutorial', style: Theme.of(context).textTheme.bodyMedium,),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Icon(IconManager.reply, color: Theme.of(context).colorScheme.secondary, size: AppSize.s28,),
              ),
              Space.w4,
              InkWell(
                onTap: () {},
                child: Icon(IconManager.delete, color: Theme.of(context).colorScheme.error, size: AppSize.s28,),
              ),
            ],
          ),
        )
      ],
    );
  }
}
