import 'package:admin_panel/src/features/features.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ui_kits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../di/di_setup.dart';
import '../../../bloc/user_manager_cubit.dart';
import '../../../bloc/user_manager_state.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  @override
  void initState() {
    UserManagerCubit.userNameController.clear();
    UserManagerCubit.passwordController.clear();
    UserManagerCubit.emailController.clear();
    super.initState();
  }

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
    child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocBuilder<UserManagerCubit, UserManagerState>(
          builder: (BuildContext context, state) {
            return ListView(
              shrinkWrap: true,
              children: [
                Space.h16,
                ACTextFormField(controller: UserManagerCubit.userNameController, hintText: textLocalization.userName),
                Space.h16,
                ACTextFormField(
                  controller: UserManagerCubit.passwordController,
                  hintText: textLocalization.password,
                  isPasswordField: isShowPassword,
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
                Space.h16,
                ACTextFormField(
                  controller: UserManagerCubit.emailController,
                  hintText: textLocalization.email,
                ),
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
                    context.read<UserManagerCubit>().addUsers(context);
                    context.pushNamed(UserManagerPage.userManagerPageName);
                  },
                  title: textLocalization.addUser,
                ),
              ],
            );
          },
        ),
      ),
    ),
    );
  }
}
