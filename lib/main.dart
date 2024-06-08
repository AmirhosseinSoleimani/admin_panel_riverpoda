import 'package:admin_panel/src/app/my_app.dart';
import 'package:admin_panel/src/di/di_setup.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  // await getIt<Storage>().init();
  runApp(const MyApp());
}
