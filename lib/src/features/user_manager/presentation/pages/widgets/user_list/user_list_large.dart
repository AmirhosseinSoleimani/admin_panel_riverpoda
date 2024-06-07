import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/add_user/add_user.dart';
import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/user_list/user_list_container_large.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class UserListLarge extends StatelessWidget {
  const UserListLarge({super.key});

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${textLocalization.userList}:', style: Theme.of(context).textTheme.titleMedium,),
            const AddUser(),
          ],
        ),
        Space.h12,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          width: double.infinity,
          color: Theme.of(context).colorScheme.onSecondary,
          height: MediaQuery.of(context).size.height * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: AppSize.s28,
              ),
              Expanded(
                flex: 2,
                child: Text(textLocalization.name, style: Theme.of(context).textTheme.displayMedium,),
              ),
              Expanded(
                  flex: 2,
                  child: Center(child: Text(textLocalization.email, style: Theme.of(context).textTheme.displayMedium,),
                  )),
              Expanded(
                child: Center(child: Text(textLocalization.gender, style: Theme.of(context).textTheme.displayMedium,)),
              ),
              Expanded(child: Center(child: Text(textLocalization.enrolled, style: Theme.of(context).textTheme.displayMedium,))),
              const SizedBox(
                width: AppSize.s48,
              ),
            ],
          ),
        ),
        Space.h12,
        ListView(
          shrinkWrap: true,
          children: const [
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 1, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 2, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 3, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 4, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 5, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 6, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 7, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 8, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 9, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 10, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 11, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
            UserListContainerLarge(firstName: 'Amirhossein',lastName: 'Soleimani', userName: '@AhSoleimani', email: 'Ah.Soleimani1313@gmail.com', gender: 'Male', enrolled: '6/7/2024', index: 12, phoneNumber: '+9383202865', birthday: '3/4/1997', job: '---',),
          ],
        )
      ],
    );
  }
}
