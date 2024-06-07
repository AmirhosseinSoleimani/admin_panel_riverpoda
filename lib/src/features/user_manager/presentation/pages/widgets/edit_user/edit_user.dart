import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ui_kits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key, required this.userName, required this.firstName, required this.lastName, required this.email, required this.gender, required this.phoneNumber, required this.birthday, required this.job});
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phoneNumber;
  final String birthday;
  final String job;


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
    selectedKey = widget.gender;
    userNameController.text = widget.userName;
    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    emailController.text = widget.email;
    phoneNumberController.text = widget.phoneNumber;
    birthdayController.text = widget.birthday;
    jobController.text = widget.job;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return InkWell(
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
                        Space.h16,
                        ACTextFormField(controller: userNameController, hintText: textLocalization.userName),
                        Space.h16,
                        ACTextFormField(controller: firstNameController, hintText: textLocalization.firstName),
                        Space.h16,
                        ACTextFormField(controller: lastNameController, hintText: textLocalization.lastName),
                        Space.h16,
                        ACTextFormField(
                          controller: emailController,
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
                            context.pop();
                          },
                          title: textLocalization.saveEdit,
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
      child: Icon(IconManager.pen, size: AppSize.s24, color: Theme.of(context).colorScheme.primary,),
    );
  }
}