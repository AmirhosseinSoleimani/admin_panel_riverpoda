import 'package:admin_panel/src/features/upload/presentation/pages/widgets/large_widget.dart';
import 'package:admin_panel/src/features/upload/presentation/pages/widgets/small_widget.dart';
import 'package:admin_panel/src/shared/ui_kits/responsive_widget/responsive_widget.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatelessWidget {
  static const uploadPageName = '/upload-page';
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      smallScreen: SmallWidgetUpload(),
      largeScreen: LargeWidgetUpload(),
    );
  }
}
