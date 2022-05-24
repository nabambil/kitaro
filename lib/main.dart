import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final getIt = GetIt.instance;
  // getIt.registerSingleton<KitaroAppState>(KitaroAppState());

  // await Hive.initFlutter('kitaro');

  runApp(KitaroApp());
}
