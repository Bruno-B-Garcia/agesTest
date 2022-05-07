import 'package:diario_das_emocoes/Routes.dart';
import 'package:diario_das_emocoes/shared/constants.shared.dart';
import 'package:diario_das_emocoes/shared/state/student-list/student-list.controller.dart';
import 'package:diario_das_emocoes/shared/state/turmas-list/turma-list.controller.dart';
import 'package:diario_das_emocoes/shared/theme.shared.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'features/login/login.presenter.dart';
import 'features/login/pages/qrcode.presenter.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDpli24Qpsd6-meYAZCx_o71moFcH3ddec",
        appId: "1:375569769208:android:88bb5365e35211624c110d",
        messagingSenderId: "375569769208",
        projectId: "diario-das-emocoes-81ff9",
      ),
    );
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginPresenter()),
          ChangeNotifierProvider(create: (_) => StudentListController()),
          ChangeNotifierProvider(create: (_) => TurmaListController()),
          ChangeNotifierProvider(create: (_) => QrcodePresenter()),
        ],
        child: const MyApp(),
      ),
    );
  } catch (e) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginPresenter()),
          ChangeNotifierProvider(create: (_) => StudentListController()),
          ChangeNotifierProvider(create: (_) => TurmaListController()),
          ChangeNotifierProvider(create: (_) => QrcodePresenter()),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: themeData,
      initialRoute: Routes.loginScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
