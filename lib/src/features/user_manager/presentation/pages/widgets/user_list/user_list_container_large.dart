import 'package:admin_panel/src/features/user_manager/presentation/bloc/user_manager_cubit.dart';
import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/delete_user/delete_user.dart';
import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/edit_user/edit_user.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../shared/ui_kits/ac_elevated_button/ac_elevate_button.dart';
import '../../../../../../shared/ui_kits/ac_text_form_field/ac_text_form_field.dart';
import '../../../../../features.dart';

class UserListContainerLarge extends StatefulWidget {
  const UserListContainerLarge(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.gender,
      required this.enrolled,
      required this.index,
      required this.phoneNumber,
      required this.birthday,
      required this.job,
      required this.id});

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

  @override
  State<UserListContainerLarge> createState() => _UserListContainerLargeState();
}

class _UserListContainerLargeState extends State<UserListContainerLarge> {
  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
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
                    child: Text(
                      '${widget.index}',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.start,
                    ),
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
                                borderRadius:
                                    BorderRadius.circular(AppSize.s60),
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer),
                            child: const Center(
                              child: Icon(IconManager.profile),
                            ),
                          ),
                          Space.w8,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.firstName} ${widget.lastName}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                widget.userName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(fontSize: AppSize.s12),
                              ),
                            ],
                          ),
                        ],
                      ))),
                  Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(widget.email,
                            style: Theme.of(context).textTheme.bodyMedium)),
                  ),
                  Expanded(
                      child: Center(
                          child: Text(widget.gender,
                              style: Theme.of(context).textTheme.bodyMedium))),
                  Expanded(
                      child: Center(
                          child: Text(widget.enrolled,
                              style: Theme.of(context).textTheme.bodyMedium))),
                  SizedBox(
                    width: AppSize.s48,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            UserManagerCubit.emailController.text = widget.email;
                            UserManagerCubit.userNameController.text = widget.userName;
                            UserManagerCubit.id = widget.id;
                            UserManagerCubit.gender = widget.gender;
                            // context.goNamed('/edit');
                            showDialog(
                              context: context,
                              builder: (BuildContext _) {
                                TextEditingController firstNameController = TextEditingController();
                                TextEditingController lastNameController = TextEditingController();
                                TextEditingController phoneNumberController = TextEditingController();
                                TextEditingController birthdayController = TextEditingController();
                                TextEditingController jobController = TextEditingController();
                                final Map<String, String> items = {
                                  'Male': '1',
                                  'Female': '2',
                                  'Another': '3',
                                };

                                String? selectedKey;
                                return Dialog(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height * 0.5,
                                    child: StatefulBuilder(
                                      builder: (BuildContext _, setState) {
                                        return Padding(
                                          padding: const EdgeInsets.all(AppPadding.p16),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Space.h16,
                                              Row(
                                                children: [
                                                  Expanded(child: ACTextFormField(controller: UserManagerCubit.userNameController, hintText: textLocalization.userName),),
                                                  Space.w8,
                                                  Expanded(
                                                    child: ACTextFormField(controller: firstNameController, hintText: textLocalization.firstName),
                                                  ),
                                                ],
                                              ),
                                              Space.h16,
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ACTextFormField(controller: lastNameController, hintText: textLocalization.lastName),
                                                  ),
                                                  Space.w8,
                                                  Expanded(child: ACTextFormField(
                                                      controller: UserManagerCubit.emailController,
                                                      hintText: textLocalization.email,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Space.h16,
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ACTextFormField(
                                                      controller: phoneNumberController,
                                                      hintText: textLocalization.phoneNumber,
                                                    ),
                                                  ),
                                                  Space.w8,
                                                  Expanded(child: ACTextFormField(
                                                    controller: birthdayController,
                                                    hintText: textLocalization.birthday,
                                                  ),
                                                  ),
                                                ],
                                              ),
                                              Space.h16,
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ACTextFormField(
                                                      controller: jobController,
                                                      hintText: textLocalization.job,
                                                    ),
                                                  ),
                                                  Space.w8,
                                                  Expanded(child: DropdownButton<String>(
                                                    hint: Text(textLocalization.selectAnItem, style: Theme.of(context).textTheme.bodyMedium,),
                                                    value: selectedKey,
                                                    items: items.keys.map((String key) {
                                                      return DropdownMenuItem<String>(
                                                        value: key,
                                                        child: Text(key),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? newKey) {
                                                      setState(() {
                                                        selectedKey = newKey;
                                                      });
                                                    },
                                                  ),
                                                  ),
                                                ],
                                              ),
                                              Space.h16,
                                              ACElevatedButton(
                                                onTap: () async{
                                                  context.read<UserManagerCubit>().updateUsers(context, UserManagerCubit.id);
                                                  context.pop();
                                                  context.pushNamed(UserManagerPage.userManagerPageName);
                                                },
                                                title: textLocalization.addUser,
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                            setState(() {});
                          },
                          child: Icon(
                            IconManager.pen,
                            size: AppSize.s24,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return StatefulBuilder(
                                  builder: (BuildContext _, setState) {
                                    return AlertDialog(
                                      content: Text(
                                        textLocalization.deletedUserMessage,
                                        style:
                                        Theme.of(context).textTheme.bodyMedium,
                                      ),
                                      actions: [
                                        InkWell(
                                          onTap: () async {
                                            await context.read<UserManagerCubit>().deleteUsers(context, widget.id);
                                            context.pop();
                                            context.pushNamed(UserManagerPage.userManagerPageName);

                                          },
                                          child: Text(
                                            textLocalization.delete,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error),
                                          ),
                                        ),
                                        Space.w16,
                                        InkWell(
                                          onTap: () {
                                            context.pop();
                                          },
                                          child: Text(
                                            textLocalization.cancel,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                            setState(() {});
                          },
                          child: Icon(
                            IconManager.delete,
                            size: AppSize.s24,
                            color: ColorThemeManager.redColor,
                          ),
                        ),
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
