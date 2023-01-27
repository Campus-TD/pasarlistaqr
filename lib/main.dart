import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

void main() => runApp(const MaterialApp(home: MyHome()));

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  MobileScannerController cameraController = MobileScannerController();
  int cont = 0;
  Set<String> set_matriculas = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner')),
      body: MobileScanner(
          allowDuplicates: false,
          onDetect: (barcode, args) {
            if (barcode.rawValue == null) {
              print('Failed to scan Barcode');
            } else {
              final String code = barcode.rawValue!;
              set_matriculas.add(code);
              cont++;
              if (cont != set_matriculas.length) {
                cont--;
              } else {
                print(set_matriculas.toString() + ' ' + cont.toString());
              }
            }
          }),
    );
  }
}
