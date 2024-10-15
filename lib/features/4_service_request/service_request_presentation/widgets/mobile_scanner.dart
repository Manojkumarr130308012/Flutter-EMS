// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// class BarcodeScannerWithScanWindow extends StatefulWidget {
//   const BarcodeScannerWithScanWindow({Key? key}) : super(key: key);
//
//   @override
//   _BarcodeScannerWithScanWindowState createState() => _BarcodeScannerWithScanWindowState();
// }
//
// class _BarcodeScannerWithScanWindowState extends State<BarcodeScannerWithScanWindow> {
//   late MobileScannerController controller = MobileScannerController();
//   Barcode? barcode;
//   BarcodeCapture? capture;
//
//   Future<void> onDetect(BarcodeCapture barcode) async {
//     capture = barcode;
//     setState(() => this.barcode = barcode.barcodes.first);
//   }
//
//   MobileScannerArguments? arguments;
//
//   @override
//   Widget build(BuildContext context) {
//     final scanWindow = Rect.fromCenter(
//       center: MediaQuery.of(context).size.center(Offset.zero),
//       width: 200,
//       height: 200,
//     );
//     return Scaffold(
//       appBar: AppBar(title: const Text('With Scan window')),
//       backgroundColor: Colors.black,
//       body: Builder(
//         builder: (context) {
//           return Stack(
//             fit: StackFit.expand,
//             children: [
//               MobileScanner(
//                 fit: BoxFit.contain,
//                 scanWindow: scanWindow,
//                 controller: controller,
//                 onScannerStarted: (arguments) {
//                   setState(() {
//                     this.arguments = arguments;
//                   });
//                 },
//                 errorBuilder: (context, error, child) {
//                   return ScannerErrorWidget(error: error);
//                 },
//                 onDetect: onDetect,
//               ),
//               if (barcode != null && barcode?.corners != null && arguments != null)
//                 CustomPaint(
//                   painter: BarcodeOverlay(
//                     barcode: barcode!,
//                     arguments: arguments!,
//                     boxFit: BoxFit.contain,
//                     capture: capture!,
//                   ),
//                 ),
//               CustomPaint(
//                 painter: ScannerOverlay(scanWindow),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   alignment: Alignment.bottomCenter,
//                   height: 100,
//                   color: Colors.black.withOpacity(0.4),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Center(
//                         child: SizedBox(
//                           width: MediaQuery.of(context).size.width - 120,
//                           height: 50,
//                           child: FittedBox(
//                             child: Text(
//                               barcode?.displayValue ?? 'Scan something!',
//                               overflow: TextOverflow.fade,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headlineMedium!
//                                   .copyWith(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ScannerOverlay extends CustomPainter {
//   ScannerOverlay(this.scanWindow);
//
//   final Rect scanWindow;
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final backgroundPath = Path()..addRect(Rect.largest);
//     final cutoutPath = Path()..addRect(scanWindow);
//
//     final backgroundPaint = Paint()
//       ..color = Colors.black.withOpacity(0.5)
//       ..style = PaintingStyle.fill
//       ..blendMode = BlendMode.dstOut;
//
//     final backgroundWithCutout = Path.combine(
//       PathOperation.difference,
//       backgroundPath,
//       cutoutPath,
//     );
//     canvas.drawPath(backgroundWithCutout, backgroundPaint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
//
// class BarcodeOverlay extends CustomPainter {
//   BarcodeOverlay({
//     required this.barcode,
//     required this.arguments,
//     required this.boxFit,
//     required this.capture,
//   });
//
//   final BarcodeCapture capture;
//   final Barcode barcode;
//   final MobileScannerArguments arguments;
//   final BoxFit boxFit;
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     if (barcode.corners == null) return;
//     final adjustedSize = applyBoxFit(boxFit, arguments.size, size);
//
//     double verticalPadding = size.height - adjustedSize.destination.height;
//     double horizontalPadding = size.width - adjustedSize.destination.width;
//     if (verticalPadding > 0) {
//       verticalPadding = verticalPadding / 2;
//     } else {
//       verticalPadding = 0;
//     }
//
//     if (horizontalPadding > 0) {
//       horizontalPadding = horizontalPadding / 2;
//     } else {
//       horizontalPadding = 0;
//     }
//
//     final ratioWidth =
//         (Platform.isIOS ? capture.width! : arguments.size.width) / adjustedSize.destination.width;
//     final ratioHeight = (Platform.isIOS ? capture.height! : arguments.size.height) /
//         adjustedSize.destination.height;
//
//     final List<Offset> adjustedOffset = [];
//     for (final offset in barcode.corners!) {
//       adjustedOffset.add(
//         Offset(
//           offset.dx / ratioWidth + horizontalPadding,
//           offset.dy / ratioHeight + verticalPadding,
//         ),
//       );
//     }
//     final cutoutPath = Path()..addPolygon(adjustedOffset, true);
//
//     final backgroundPaint = Paint()
//       ..color = Colors.red.withOpacity(0.3)
//       ..style = PaintingStyle.fill
//       ..blendMode = BlendMode.dstOut;
//
//     canvas.drawPath(cutoutPath, backgroundPaint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
//
// class ScannerErrorWidget extends StatelessWidget {
//   const ScannerErrorWidget({Key? key, required this.error}) : super(key: key);
//
//   final MobileScannerException error;
//
//   @override
//   Widget build(BuildContext context) {
//     String errorMessage;
//
//     switch (error.errorCode) {
//       case MobileScannerErrorCode.controllerUninitialized:
//         errorMessage = 'Controller not ready.';
//         break;
//       case MobileScannerErrorCode.permissionDenied:
//         errorMessage = 'Permission denied';
//         break;
//       case MobileScannerErrorCode.unsupported:
//         errorMessage = 'Scanning is unsupported on this device';
//         break;
//       default:
//         errorMessage = 'Generic Error';
//         break;
//     }
//
//     return ColoredBox(
//       color: Colors.black,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(bottom: 16),
//               child: Icon(Icons.error, color: Colors.white),
//             ),
//             Text(
//               errorMessage,
//               style: const TextStyle(color: Colors.white),
//             ),
//             Text(
//               error.errorDetails?.message ?? '',
//               style: const TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class BarcodeListScannerWithController extends StatefulWidget {
//   const BarcodeListScannerWithController({Key? key}) : super(key: key);
//
//   @override
//   _BarcodeListScannerWithControllerState createState() => _BarcodeListScannerWithControllerState();
// }
//
// class _BarcodeListScannerWithControllerState extends State<BarcodeListScannerWithController>
//     with SingleTickerProviderStateMixin {
//   BarcodeCapture? barcodeCapture;
//
//   final MobileScannerController controller = MobileScannerController(
//     // torchEnabled: true,
//     formats: [BarcodeFormat.qrCode],
//     facing: CameraFacing.back,
//     detectionSpeed: DetectionSpeed.normal,
//     detectionTimeoutMs: 1000,
//     returnImage: true,
//   );
//
//   bool isStarted = true;
//
//   void _startOrStop() {
//     try {
//       if (isStarted) {
//         controller.stop();
//       } else {
//         controller.start();
//       }
//       setState(() {
//         isStarted = !isStarted;
//       });
//     } on Exception catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Something went wrong! $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('With ValueListenableBuilder')),
//       backgroundColor: Colors.black,
//       body: Builder(
//         builder: (context) {
//           return Stack(
//             children: [
//               MobileScanner(
//                 controller: controller,
//                 errorBuilder: (context, error, child) {
//                   return ScannerErrorWidget(error: error);
//                 },
//                 fit: BoxFit.contain,
//                 onDetect: (barcodeCapture) {
//                   setState(() {
//                     this.barcodeCapture = barcodeCapture;
//                   });
//                   print(barcodeCapture.barcodes.map((e) => e.displayValue));
//                 },
//                 onScannerStarted: (arguments) {
//                   // Do something with arguments.
//                 },
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   alignment: Alignment.bottomCenter,
//                   height: 100,
//                   color: Colors.black.withOpacity(0.4),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       IconButton(
//                         color: Colors.white,
//                         icon: ValueListenableBuilder(
//                           valueListenable: controller.torchState,
//                           builder: (context, state, child) {
//                             if (state == null) {
//                               return const Icon(
//                                 Icons.flash_off,
//                                 color: Colors.grey,
//                               );
//                             }
//                             switch (state as TorchState) {
//                               case TorchState.off:
//                                 return const Icon(
//                                   Icons.flash_off,
//                                   color: Colors.grey,
//                                 );
//                               case TorchState.on:
//                                 return const Icon(
//                                   Icons.flash_on,
//                                   color: Colors.yellow,
//                                 );
//                             }
//                           },
//                         ),
//                         iconSize: 32.0,
//                         onPressed: () => controller.toggleTorch(),
//                       ),
//                       IconButton(
//                         color: Colors.white,
//                         icon: isStarted ? const Icon(Icons.stop) : const Icon(Icons.play_arrow),
//                         iconSize: 32.0,
//                         onPressed: _startOrStop,
//                       ),
//                       Center(
//                         child: SizedBox(
//                           width: MediaQuery.of(context).size.width - 200,
//                           height: 50,
//                           child: FittedBox(
//                             child: Text(
//                               '${barcodeCapture?.barcodes.map((e) => e.rawValue) ?? 'Scan something!'}',
//                               overflow: TextOverflow.fade,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headlineMedium!
//                                   .copyWith(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         color: Colors.white,
//                         icon: ValueListenableBuilder(
//                           valueListenable: controller.cameraFacingState,
//                           builder: (context, state, child) {
//                             if (state == null) {
//                               return const Icon(Icons.camera_front);
//                             }
//                             switch (state as CameraFacing) {
//                               case CameraFacing.front:
//                                 return const Icon(Icons.camera_front);
//                               case CameraFacing.back:
//                                 return const Icon(Icons.camera_rear);
//                             }
//                           },
//                         ),
//                         iconSize: 32.0,
//                         onPressed: () => controller.switchCamera(),
//                       ),
//                       // IconButton(
//                       //   color: Colors.white,
//                       //   icon: const Icon(Icons.image),
//                       //   iconSize: 32.0,
//                       //   onPressed: () async {
//                       //     final ImagePicker picker = ImagePicker();
//                       //     // Pick an image
//                       //     final XFile? image = await picker.pickImage(
//                       //       source: ImageSource.gallery,
//                       //     );
//                       //     if (image != null) {
//                       //       if (await controller.analyzeImage(image.path)) {
//                       //         if (!mounted) return;
//                       //         ScaffoldMessenger.of(context).showSnackBar(
//                       //           const SnackBar(
//                       //             content: Text('Barcode found!'),
//                       //             backgroundColor: Colors.green,
//                       //           ),
//                       //         );
//                       //       } else {
//                       //         if (!mounted) return;
//                       //         ScaffoldMessenger.of(context).showSnackBar(
//                       //           const SnackBar(
//                       //             content: Text('No barcode found!'),
//                       //             backgroundColor: Colors.red,
//                       //           ),
//                       //         );
//                       //       }
//                       //     }
//                       //   },
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  void initState() {
    _screenWasClosed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          MobileScanner(
              controller: cameraController,
              onDetect: (BarcodeCapture barcode) {
                if (!_screenOpened) {
                  final String code = barcode.barcodes.first.displayValue ?? "";
                  print("---------------------Asset is $code ------------------------");
                  Future.delayed(Duration.zero, () {
                    context.pop(code);
                  });
                  // Future.delayed(Duration.zero, () {
                  //   Navigator.of(context).pop(code);
                  // });
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  //   context.pop(code);
                  // });
                }
              }),
          QRScannerOverlay(
            overlayColour: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  void _foundBarcode(BarcodeCapture barcode) {
    if (!_screenOpened) {
      final String code = barcode.barcodes.first.displayValue ?? "";
      print("---------------------Asset is $code ------------------------");
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pop(code);
      });
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}

/////////////////////////////////////////////////////////////
///
/////////////////////////////////////////////////////////////

class QRScannerOverlay extends StatelessWidget {
  const QRScannerOverlay({Key? key, required this.overlayColour}) : super(key: key);

  final Color overlayColour;

  @override
  Widget build(BuildContext context) {
    // // Changing the size of scanner cutout dependent on the device size.
    double scanArea =
        (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400)
            ? 200.0
            : 330.0;
    return Stack(children: [
      ColorFiltered(
        colorFilter:
            ColorFilter.mode(overlayColour, BlendMode.srcOut), // This one will create the magic
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  backgroundBlendMode:
                      BlendMode.dstOut), // This one will handle background + difference out
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: scanArea,
                width: scanArea,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: CustomPaint(
          foregroundPainter: BorderPainter(),
          child: SizedBox(
            width: scanArea + 25,
            height: scanArea + 25,
          ),
        ),
      ),
    ]);
  }
}

// Creates the white borders
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 4.0;
    const radius = 20.0;
    const tRadius = 3 * radius;
    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(radius));
    const clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BarReaderSize {
  static double width = 200;
  static double height = 200;
}

class OverlayWithHolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;
    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addOval(
                Rect.fromCircle(center: Offset(size.width - 44, size.height - 44), radius: 40))
            ..close(),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
}

/////////////////////////////////////////////////////////////
///
/////////////////////////////////////////////////////////////

class FoundScreen extends StatefulWidget {
  final String value;
  final Function() screenClose;
  const FoundScreen({Key? key, required this.value, required this.screenClose}) : super(key: key);

  @override
  State<FoundScreen> createState() => _FoundScreenState();
}

class _FoundScreenState extends State<FoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                onPressed: () => Navigator.pop(context, false),
              ),
            );
          },
        ),
        title: const Text("Result", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Result: ",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(widget.value, style: const TextStyle(fontSize: 16))
            ],
          ),
        ),
      ),
    );
  }
}
