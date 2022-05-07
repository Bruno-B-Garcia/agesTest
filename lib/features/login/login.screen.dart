import 'package:diario_das_emocoes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../shared/constants.shared.dart';
import 'login.presenter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final token = TextEditingController();

  late final LoginPresenter loginPresenter;

  @override
  void initState() {
    super.initState();

    final loginPresenter = context.read<LoginPresenter>();

    loginPresenter.addListener(() {
      if (loginPresenter.isAdmin) {
        loginPresenter.setIsAdmin(false);
        //Sucesso -> Passa pra pagina admin
        Navigator.pushNamed(context, Routes.adminScreen);
      } else if (loginPresenter.hasValidToken) {
        loginPresenter.setHasValidToken(false);
        //Sucesso -> Passa pra pagina de home
        Navigator.pushNamed(context, Routes.homeScreen);
      }
    });
  }

  @override
  void dispose() {
    token.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: size.width,
            height: size.height * 0.6,
            color: Constants.primaryColor,
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.4,
              color: Constants.secondaryColor,
            )),
        Positioned(
          top: size.height * 0.313,
          right: size.height * 0.445,
          child: Image.asset(
            Constants.loginEmotes,
            scale: size.height * 0.00137,
          ),
        ),
        Positioned(
          top: size.height * 0.323,
          left: size.height * 0.474,
          child: Text(
            Constants.appDescription,
            textAlign: TextAlign.right,
            style: GoogleFonts.raleway(
              fontSize: size.height * 0.0248,
              fontWeight: FontWeight.w600,
              color: Constants.secondaryColor,
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.099,
          right: size.height * 0.21,
          child: Text(
            "Diário das",
            textAlign: TextAlign.right,
            style: GoogleFonts.raleway(
              fontSize: size.height * 0.0537,
              fontWeight: FontWeight.w800,
              color: Constants.secondaryColor,
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.108,
          right: size.height * 0.19531,
          child: Text(
            "Emoções",
            textAlign: TextAlign.right,
            style: GoogleFonts.rancho(
              fontSize: size.height * 0.1367,
              fontWeight: FontWeight.normal,
              color: const Color.fromARGB(255, 253, 172, 65),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.743,
          right: size.height * 0.2344,
          child: Text(
            "Digite o token da turma",
            textAlign: TextAlign.right,
            style: GoogleFonts.raleway(
              fontSize: size.height * 0.02442,
              fontWeight: FontWeight.normal,
              color: const Color.fromARGB(255, 158, 158, 158),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.801,
          right: size.height * 0.239,
          child: SizedBox(
            height: size.height * 0.0976,
            width: size.height * 0.254,
            child: Consumer<LoginPresenter>(
              builder: (context, loginPresenter, child) {
                return TextField(
                  controller: token,
                  onChanged: (fieldData) =>
                      loginPresenter.checkToken(fieldData),
                  style: TextStyle(
                    fontSize: size.height * 0.0391,
                    letterSpacing: size.height * 0.03418,
                  ),
                  maxLength: 5,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.9083,
          right: size.height * 0.293,
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: size.height * 0.01954),
            ),
            onPressed: () {
              //manda email para o professor
            },
            child: Text(
              'Esqueceu o token?\n       Clique aqui',
              style: GoogleFonts.raleway(
                fontSize: size.height * 0.01465,
                color: const Color.fromARGB(255, 158, 158, 158),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.51,
          left: size.height * 0.49,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(size.height * 0.024),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size.height * 0.008),
              ),
              primary: const Color.fromARGB(255, 232, 235, 253),
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.qrcodeScreen);
            },
            child: Text(
              'Acesso QR Code',
              style: GoogleFonts.raleway(
                fontSize: size.height * 0.02,
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
