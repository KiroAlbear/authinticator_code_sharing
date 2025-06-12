import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          onDetect: (barcodes) {
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

  Future<bool> gethtmlpermissions() async {
    // request web permissions for camera, microphone, gps, photolibrary, notifications
// Requesting permissions for camera, microphone, gps, photolibrary, notifications

    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
    ].request();

    // Checking if permissions are granted or not

    if (statuses[Permission.camera] == PermissionStatus.granted) {
      print('Camera permissions granted');
      return true;
    } else {
      print('Camera permissions not granted');
      return false;
    }
  }

  //
  // Future<bool> _requestCameraPermission() async {
  //   // Check the current status
  //   var status = await Permission.camera.status;
  //
  //   if (status.isGranted) {
  //     return true;
  //     // setState(() => _permissionStatus = 'Camera permission granted!');
  //     // Proceed to use the camera
  //   } else if (status.isDenied) {
  //     var requestedStatus = await Permission.camera.request();
  //     if (requestedStatus.isGranted) {
  //       return true;
  //       // setState(() => _permissionStatus = 'Camera permission granted!');
  //     } else {
  //       return false;
  //       // setState(() => _permissionStatus = 'Camera permission denied.');
  //     }
  //   } else {
  //     return false;
  //     // setState(() {
  //     //   _permissionStatus = 'Unknown permission state. Please try again.';
  //     // });
  //   }
  // }

  String extractSecretKey(String otpAuthUrl) {
    final uri = Uri.parse(otpAuthUrl);
    final secretKey = uri.queryParameters['secret'];
    return secretKey ?? '';
    // print('Secret Key: $secretKey');
  }
}
