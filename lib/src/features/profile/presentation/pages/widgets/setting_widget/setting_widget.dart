import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';

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
              child: Image.asset('assets/image/user_profile.jpg', height: AppSize.s150,),
            ),
            Space.h32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('UserName:', style: Theme.of(context).textTheme.titleMedium),
                Text('@AhSoleimani', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Change Image', style: Theme.of(context).textTheme.titleMedium),
                InkWell(
                  onTap: () {},
                  child: const Icon(IconManager.addPhoto, size: AppSize.s28,),
                ),
              ],
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Theme', style: Theme.of(context).textTheme.titleMedium),
                Switch(
                    value: false,
                    onChanged: (value) {},
                ),
              ],
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Change Language', style: Theme.of(context).textTheme.titleMedium),
                DropdownButton<String>(
                  hint: Text('Select an Item', style: Theme.of(context).textTheme.bodyMedium,),
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
              ],
            ),
            Space.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('LogOut', style: Theme.of(context).textTheme.titleMedium),
                InkWell(
                  onTap: () {},
                  child: Icon(IconManager.logOut, size: AppSize.s28, color: Theme.of(context).colorScheme.error,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
