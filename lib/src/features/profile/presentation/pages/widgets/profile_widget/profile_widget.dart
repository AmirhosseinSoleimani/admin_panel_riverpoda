import 'package:admin_panel/src/features/profile/presentation/pages/widgets/edit_profile/edit_profile.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.all(AppPadding.p8),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
              width: AppSize.s2,
              color: Theme.of(context).colorScheme.secondaryContainer)),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textLocalization.myProfile, style: Theme.of(context).textTheme.bodyMedium),
                const EditProfile(
                  firstName: 'Amirhossein',
                  middleName: '---',
                  lastName: 'Soleimani',
                  email: 'Ah.Soleimani@gmail.com',
                  phoneNumber: '+9383202865',
                  job: '---',
                  birthday: '3/4/1997',
                  gender: 'Male',
                ),
              ],
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textLocalization.firstName, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                      Space.h8,
                      Text('Amirhossein', style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textLocalization.middleName, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                      Space.h8,
                      Text('---', style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textLocalization.lastName, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                      Space.h8,
                      Text('Soleimani', style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                )
              ],
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textLocalization.email, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                      Space.h8,
                      Text('Ah.Soleimani@gmail.com', style: Theme.of(context).textTheme.bodyMedium,)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textLocalization.phoneNumber, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                      Space.h8,
                      Text('+9383202865', style: Theme.of(context).textTheme.bodyMedium,)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textLocalization.gender, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                      Space.h8,
                      Text('Male', style: Theme.of(context).textTheme.bodyMedium,)
                    ],
                  ),
                )
              ],
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textLocalization.enrolled, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                      Space.h8,
                      Text('6/7/2024', style: Theme.of(context).textTheme.bodyMedium,)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textLocalization.birthday, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                      Space.h8,
                      Text('3/4/1997', style: Theme.of(context).textTheme.bodyMedium,)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textLocalization.job, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                      Space.h8,
                      Text('---', style: Theme.of(context).textTheme.bodyMedium,)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
