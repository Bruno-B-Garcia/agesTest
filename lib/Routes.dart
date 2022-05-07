// ignore_for_file: file_names
import 'package:diario_das_emocoes/features/login/pages/qrcode.screen.dart';
import 'package:diario_das_emocoes/features/admin/student-list/student-list.screen.dart';
import 'package:diario_das_emocoes/features/admin/turma-list/turma-list.screen.dart';
import 'package:flutter/material.dart';

import 'features/admin/admin.screen.dart';
import 'features/home/home.screen.dart';
import 'features/login/login.screen.dart';

class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String loginScreen = '/login';
  static const String homeScreen = '/home';
  static const String qrcodeScreen = '/qrcode';
  static const String studentScreen = '/studentScreen';
  static const String turmaScreen = '/turmaScreen';
  static const String adminScreen = '/adminScreen';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.qrcodeScreen:
        return MaterialPageRoute(builder: (_) => const QrcodeScreen());
      case Routes.studentScreen:
        return MaterialPageRoute(builder: (_) => const StudentListScreen());
      case Routes.turmaScreen:
        return MaterialPageRoute(builder: (_) => const TurmaListScreen());
      case Routes.adminScreen:
        return MaterialPageRoute(builder: (_) => const AdminScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
