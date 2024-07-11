import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:football_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:football_app/data/repos/authentication.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

void main() async {
  //add Widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // Init local Storage
  await GetStorage.init();
  // await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Todo Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepo()));

  //Todo Initialize Authentication

  runApp(const App());
}
