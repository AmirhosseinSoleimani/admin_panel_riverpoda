import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ui_kits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
  bool isShowPassword = false;
  String? selectedKey;
  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return ACInkwellButton(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      width: AppSize.s150,
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Space.h8,
                        ACTextFormField(controller: userNameController, hintText: textLocalization.userName),
                        Space.h8,
                        ACTextFormField(
                          controller: passwordController,
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
                        Space.h8,
                        ACTextFormField(controller: firstNameController, hintText: textLocalization.firstName),
                        Space.h8,
                        ACTextFormField(controller: lastNameController, hintText: textLocalization.lastName),
                        Space.h8,
                        ACTextFormField(
                          controller: emailController,
                          hintText: textLocalization.email,
                        ),
                        Space.h8,
                        ACTextFormField(
                          controller: phoneNumberController,
                          hintText: textLocalization.phoneNumber,
                        ),
                        Space.h8,
                        ACTextFormField(
                          controller: birthdayController,
                          hintText: textLocalization.birthday,
                        ),
                        Space.h8,
                        ACTextFormField(
                          controller: jobController,
                          hintText: textLocalization.job,
                        ),
                        Space.h8,
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
                            context.pop();
                          },
                          title: textLocalization.addUser,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(IconManager.add),
          Text(textLocalization.addUser, style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
