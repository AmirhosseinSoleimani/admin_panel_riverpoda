import 'package:admin_panel/src/features/features.dart';
import 'package:admin_panel/src/features/user_manager/presentation/bloc/user_manager_cubit.dart';
import 'package:admin_panel/src/features/user_manager/presentation/bloc/user_manager_state.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ui_kits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../di/di_setup.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key});


  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  final Map<String, String> items = {
    'Male': '1',
    'Female': '2',
    'Another': '3',
  };

  String? selectedKey;
  @override
  void initState() {
    super.initState();
    selectedKey = UserManagerCubit.gender;
  }
  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (BuildContext context) {
        var bloc = getIt<UserManagerCubit>();
        bloc.getAllUsers();
        return bloc;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: BlocBuilder<UserManagerCubit, UserManagerState>(builder: (BuildContext context, state) { 
            return ListView(
              shrinkWrap: true,
              children: [
                Space.h16,
                ACTextFormField(controller: UserManagerCubit.userNameController, hintText: textLocalization.userName),
                Space.h16,
                ACTextFormField(controller: firstNameController, hintText: textLocalization.firstName),
                Space.h16,
                ACTextFormField(controller: lastNameController, hintText: textLocalization.lastName),
                Space.h16,
                ACTextFormField(
                  controller: UserManagerCubit.emailController,
                  hintText: textLocalization.email,
                ),
                Space.h16,
                ACTextFormField(
                  controller: phoneNumberController,
                  hintText: textLocalization.phoneNumber,
                ),
                Space.h16,
                ACTextFormField(
                  controller: birthdayController,
                  hintText: textLocalization.birthday,
                ),
                Space.h16,
                ACTextFormField(
                  controller: jobController,
                  hintText: textLocalization.job,
                ),
                Space.h16,
                Row(
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
                Space.h16,
                ACElevatedButton(
                  onTap: () {
                    context.read<UserManagerCubit>().updateUsers(context, UserManagerCubit.id);
                    context.pushNamed(UserManagerPage.userManagerPageName);
                  },
                  title: textLocalization.save,
                )
              ],
            );
          },
          ),
        ),
      ),
    );
  }
}