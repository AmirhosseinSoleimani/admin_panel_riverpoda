import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ac_text_form_field/ac_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DescriptionVideo extends StatefulWidget {
  const DescriptionVideo({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  State<DescriptionVideo> createState() => _DescriptionVideoState();
}

class _DescriptionVideoState extends State<DescriptionVideo> {
  TextEditingController videoTitle = TextEditingController();
  TextEditingController videoDescription = TextEditingController();

  @override
  void initState() {
    videoTitle.text = widget.title;
    videoDescription.text = widget.description;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ACTextFormField(controller: videoTitle, hintText: textLocalization.title),
        Space.h16,
        ACTextFormField(controller: videoDescription, hintText: textLocalization.description, maxLines: 6,),
        Space.h16,
        Text(
          '12k views 5d ago',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
    );
  }
}