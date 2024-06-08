import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/delete_user/delete_user.dart';
import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/edit_user/edit_user.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserListContainerSmall extends StatelessWidget {
  const UserListContainerSmall({super.key, required this.firstName, required this.lastName, required this.userName, required this.email, required this.gender, required this.enrolled, required this.index, required this.phoneNumber, required this.birthday, required this.job, required this.id, required this.onTap});
  final int index;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String enrolled;
  final String gender;
  final String phoneNumber;
  final String birthday;
  final String job;
  final String id;
  final VoidCallback onTap;

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
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$firstName $lastName', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: AppSize.s12),),
                              Text(userName, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: AppSize.s12),),
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Text(email, style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      SizedBox(
                        width: AppSize.s48,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                context.goNamed('/edit');
                              },
                              child: Icon(
                                IconManager.pen,
                                size: AppSize.s24,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            DeleteUser(id: id,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
