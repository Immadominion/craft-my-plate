import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/presentation/screens/auth/authentication.dart';
import 'package:learn/utils/locator.dart';
import 'data/controllers/theme_notifier.dart';
import 'firebase_options.dart';
import 'presentation/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider).isDarkMode;
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          log(snapshot.error.toString());
          return const Placeholder();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          // Check if the user is logged in
          User? user = FirebaseAuth.instance.currentUser;
          //TODO: change back to ```!=``` for testing tomorrow
          Widget initialScreen =
              user == null ? const AuthScreen() : const HomePage();

          log("User peek: ${user.toString()}");

          return ScreenUtilInit(
            designSize: const Size(375, 667),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, __) => MaterialApp(
              title: 'Craft My Plate',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromRGBO(96, 23, 170, 1),
                  brightness: Brightness.light,
                ),
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.blueGrey,
                  brightness: Brightness.dark,
                ),
                useMaterial3: true,
              ),
              themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
              home: initialScreen,
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const CircularProgressIndicator();
      },
    );
  }
}
