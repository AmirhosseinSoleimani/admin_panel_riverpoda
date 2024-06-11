import 'package:admin_panel/src/app/locale_provider.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/resources/theme/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../../features.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  final Map<String, String> items = {
    'English': '1',
    'فارسی': '2',
  };
  String? selectedKey;

  @override
  void initState() {
    selectedKey = 'English';
    super.initState();
  }

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
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s12),
              child: Image.asset(
                'assets/image/user_profile.jpg',
                height: AppSize.s150,
              ),
            ),
            Space.h32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${textLocalization.userName}:',
                    style: Theme.of(context).textTheme.bodyMedium),
                Text('@AhSoleimani',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textLocalization.changeImage,
                    style: Theme.of(context).textTheme.bodyMedium),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    IconManager.addPhoto,
                    size: AppSize.s28,
                  ),
                ),
              ],
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textLocalization.darkMode,
                    style: Theme.of(context).textTheme.bodyMedium),
                Switch(
                  value: BlocProvider.of<ThemeCubit>(context).isDark,
                  onChanged: (value) {
                    BlocProvider.of<ThemeCubit>(context).toggleTheme();
                  },
                ),
              ],
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textLocalization.changeLanguage,
                    style: Theme.of(context).textTheme.bodyMedium),
                DropdownButton<String>(
                  hint: Text(
                    textLocalization.selectAnItem,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
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
                      if(newKey == 'English') {
                        context.read<LocaleProvider>().changeLocale(const Locale('en'));
                      } else if (newKey == 'فارسی') {
                        context.read<LocaleProvider>().changeLocale(const Locale('fa'));
                      } else{
                        context.read<LocaleProvider>().changeLocale(const Locale('en'));
                      }
                    });
                  },
                ),
              ],
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textLocalization.logOut,
                    style: Theme.of(context).textTheme.bodyMedium),
                InkWell(
                  onTap: () {
                    context.pushReplacementNamed(LoginPage.loginPageName);
                  },
                  child: Icon(
                    IconManager.logOut,
                    size: AppSize.s28,
                    color: Theme.of(context).colorScheme.error,
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
