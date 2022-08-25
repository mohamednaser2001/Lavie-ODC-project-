import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var height,width;
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
  @override
  void reassemble()async {
    super.reassemble();
    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }


  @override
  Widget build(BuildContext context) {

    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),

          ],
        ),
    );
  }

  Widget buildQrView(context)=>QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: width*0.79,
      borderLength: 85,
      borderColor: Colors.white,
      borderWidth: 6.5,

    ),
  );

  void onQRViewCreated(QRViewController controller){
    setState(()=>this.controller=controller);
    controller.scannedDataStream.listen((barcode)=>setState(() =>this.barcode=barcode ),);
  }
}