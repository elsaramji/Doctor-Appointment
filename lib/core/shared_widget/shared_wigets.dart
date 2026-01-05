import 'package:flutter/material.dart';

import '../routes/app_router.dart';
import '../themes/app_theme.dart';

// MaterialApp widget
class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Cure',
      theme: AppTheme.lightTheme,
    );
  }
}
