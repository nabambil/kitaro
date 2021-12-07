import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'app_state.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<KitaroAppState>(KitaroAppState());
  runApp(KitaroApp());
}
