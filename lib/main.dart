import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'app_state.dart';

void main() async {
  final getIt = GetIt.instance;
  getIt.registerSingleton<KitaroAppState>(KitaroAppState());

  await Hive.initFlutter('kitaro');

  runApp(KitaroApp());
}
