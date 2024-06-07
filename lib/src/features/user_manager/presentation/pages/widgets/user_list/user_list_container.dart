import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/delete_user/delete_user.dart';
import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/edit_user/edit_user.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';

class UserListContainer extends StatelessWidget {
  const UserListContainer({super.key, required this.firstName, required this.lastName, required this.userName, required this.email, required this.gender, required this.enrolled, required this.index});
  final int index;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String enrolled;
  final String gender;

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
                    children: [
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: AppSize.s42,
                                    height: AppSize.s42,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(AppSize.s60),
                                        color: Theme.of(context).colorScheme.secondaryContainer
                                    ),
                                    child: const Center(
                                      child: Icon(
                                          IconManager.profile
                                      ),
                                    ),
                                  ),
                                  Space.w8,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('$firstName $lastName', style: Theme.of(context).textTheme.bodyMedium,),
                                      Text(userName, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: AppSize.s12),),
                                    ],
                                  ),
                                ],
                              ))),
                      Expanded(
                        flex: 2,
                        child: Center(child: Text(email, style: Theme.of(context).textTheme.bodyMedium)),
                      ),
                      Expanded(child: Center(child: Text(gender, style: Theme.of(context).textTheme.bodyMedium))),
                      Expanded(child: Center(child: Text(enrolled, style: Theme.of(context).textTheme.bodyMedium))),
                      SizedBox(
                        width: AppSize.s48,
                        child: Row(
                          children: [
                            EditUser(
                              userName: userName,
                              firstName: firstName,
                              lastName: lastName,
                              email: email,
                              gender: gender,
                            ),
                            const DeleteUser(),
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
