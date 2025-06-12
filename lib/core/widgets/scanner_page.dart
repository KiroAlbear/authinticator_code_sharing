import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          onDetect: (barcodes) {
            // get the secret key from the string otpauth://totp/OpenAI:john.dill2030@gmail.com?secret=5N2YXWLSJPCRF6VLPFQMT3SIZBPCDGMO&issuer=OpenAI
            final String barcode = barcodes.barcodes.first.rawValue ?? '';
            Navigator.pop(
              context,
              extractSecretKey(barcode),
            );
          },
        ),
        PositionedDirectional(
          top: 50,
          end: 10,
          child: IconButton(
            icon: const Icon(Icons.close, size: 30, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  String extractSecretKey(String otpAuthUrl) {
    final uri = Uri.parse(otpAuthUrl);
    final secretKey = uri.queryParameters['secret'];
    return secretKey ?? '';
    // print('Secret Key: $secretKey');
  }
}
