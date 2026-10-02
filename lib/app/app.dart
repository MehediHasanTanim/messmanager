import 'package:flutter/material.dart';

import 'config/app_environment.dart';

class MessManagerApp extends StatelessWidget {
  const MessManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final environment = AppEnvironment.current;

    return MaterialApp(
      title: 'Mess Manager BD',
      debugShowCheckedModeBanner: environment.isDevelopment,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF007A46)),
        useMaterial3: true,
      ),
      home: ProjectPreparationScreen(environment: environment),
    );
  }
}

class ProjectPreparationScreen extends StatelessWidget {
  const ProjectPreparationScreen({required this.environment, super.key});

  final AppEnvironment environment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Mess Manager BD — ${environment.label} environment',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
