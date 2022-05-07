import 'dart:io';

import 'package:diario_das_emocoes/features/login/pages/qrcode-enum.state.dart';
import 'package:diario_das_emocoes/features/login/pages/qrcode.presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan/scan.dart';

import '../../../Routes.dart';

class QrcodeScreen extends StatefulWidget {
  const QrcodeScreen({Key? key}) : super(key: key);

  @override
  State<QrcodeScreen> createState() => _QrcodeScreenState();
}

class _QrcodeScreenState extends State<QrcodeScreen> {
  ScanController controller = ScanController();
  String qrcode = 'Unknown';

  late final QrcodePresenter qrcodePresenter;

  @override
  void initState() {
    super.initState();

    final qrcodePresenter = context.read<QrcodePresenter>();

    qrcodePresenter.addListener(() {
      if (qrcodePresenter.state == QrcodeLoginState.success) {
        //Sucesso -> Passa pra pagina home
        Navigator.pushNamed(context, Routes.homeScreen);
      } else if (qrcodePresenter.state == QrcodeLoginState.error) {
        //Falha -> Fica na mesma página e da refresh no leitor de QR
        controller.resume();
      }
    });
  }

  @override
  void dispose() {
    //Perguntar pro Joseph, o que é isso aqui?

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Consumer<QrcodePresenter>(
          builder: (context, qrcodePresenter, child) {
            return SizedBox(
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: ScanView(
                  controller: controller,
                  scanAreaScale: .6,
                  scanLineColor: Colors.blue.shade400,
                  onCapture: (data) {
                    setState(() {
                      qrcode = data;
                    });
                    qrcodePresenter.logIn(data);

                    if (qrcodePresenter.state == QrcodeLoginState.error) {
                      sleep(const Duration(seconds: 2));
                      controller.resume();
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
