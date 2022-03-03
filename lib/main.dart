import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';

import 'app.dart';
import 'app_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final getIt = GetIt.instance;
  getIt.registerSingleton<KitaroAppState>(KitaroAppState());

  await Hive.initFlutter('kitaro');

  runApp(KitaroApp());
}
