import 'package:admin_panel/src/features/user_manager/presentation/bloc/user_manager_cubit.dart';
import 'package:admin_panel/src/features/user_manager/presentation/bloc/user_manager_state.dart';
import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/add_user/add_user.dart';
import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/user_list/user_list_container_large.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ac_loading/ac_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../di/di_setup.dart';
import '../../../../../../shared/ui_kits/ac_elevated_button/ac_elevate_button.dart';
import '../../../../../../shared/ui_kits/ac_inkwell_button/ac_inkwell_button.dart';
import '../../../../../../shared/ui_kits/ac_text_form_field/ac_text_form_field.dart';
import '../../../../../features.dart';

class UserListLarge extends StatefulWidget {
  const UserListLarge({super.key});

  @override
  State<UserListLarge> createState() => _UserListLargeState();
}

class _UserListLargeState extends State<UserListLarge> {

  final Map<String, String> items = {
    'Male': '1',
    'Female': '2',
    'Another': '3',
  };
  bool isShowPassword = false;
  String? selectedKey;

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (BuildContext context) {
        var bloc = getIt<UserManagerCubit>();
        bloc.getAllUsers();
        return bloc;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${textLocalization.userList}:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ACInkwellButton(
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                width: AppSize.s150,
                onTap: () {
                  UserManagerCubit.emailController.clear();
                  UserManagerCubit.userNameController.clear();
                  UserManagerCubit.passwordController.clear();
                  showDialog(
                    context: context,
                    builder: (BuildContext _) {
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
                                        Expanded(child: ACTextFormField(controller: UserManagerCubit.userNameController, hintText: textLocalization.userName)),
                                        Space.w8,
                                        Expanded(
                                          child: ACTextFormField(
                                            controller: UserManagerCubit.passwordController,
                                            hintText: textLocalization.password,
                                            isPasswordField: !isShowPassword,
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isShowPassword =! isShowPassword;
                                                });
                                              },
                                              child: Icon(
                                                  isShowPassword ? IconManager.visibility : IconManager.visibilityOff
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Space.h16,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ACTextFormField(
                                            controller: UserManagerCubit.emailController,
                                            hintText: textLocalization.email,
                                          ),
                                        ),
                                        Space.w8,
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: DropdownButton<String>(
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
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: AppSize.s60,
                                                      height: AppSize.s60,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Theme.of(context).colorScheme.secondaryContainer
                                                      ),
                                                      child: const Center(
                                                        child: Icon(
                                                            IconManager.add
                                                        ),
                                                      ),
                                                    ),
                                                    Text(textLocalization.addPhoto, style: Theme.of(context).textTheme.bodyMedium,),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Space.h16,
                                    ACElevatedButton(
                                      onTap: () async{
                                        await context.read<UserManagerCubit>().addUsers(context);
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(IconManager.add),
                    Text(
                      textLocalization.addUser,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
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
                  child: Text(
                    textLocalization.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        textLocalization.email,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    )),
                Expanded(
                  child: Center(
                      child: Text(
                    textLocalization.gender,
                    style: Theme.of(context).textTheme.displayMedium,
                  )),
                ),
                Expanded(
                    child: Center(
                        child: Text(
                  textLocalization.enrolled,
                  style: Theme.of(context).textTheme.displayMedium,
                ))),
                const SizedBox(
                  width: AppSize.s48,
                ),
              ],
            ),
          ),
          Space.h12,
          BlocBuilder<UserManagerCubit, UserManagerState>(
            builder: (BuildContext context, state) {
              return state.whenOrNull(
                    loading: () => const ACLoading(),
                    success: () => ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          context.read<UserManagerCubit>().listAllUsers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return UserListContainerLarge(
                          firstName: 'firstName',
                          lastName: 'lastName',
                          userName: context
                              .read<UserManagerCubit>()
                              .listAllUsers[index]
                              .username!,
                          email: context
                              .read<UserManagerCubit>()
                              .listAllUsers[index]
                              .email!,
                          gender: 'Male',
                          enrolled: context
                              .read<UserManagerCubit>()
                              .listAllUsers[index]
                              .createdAt!,
                          index: index + 1,
                          phoneNumber: '+9383202865',
                          birthday: '3/4/1997',
                          job: '---',
                          id: context
                              .read<UserManagerCubit>()
                              .listAllUsers[index]
                              .iD!
                              .toString(),
                        );
                      },
                    ),
                  ) ??
                  const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
