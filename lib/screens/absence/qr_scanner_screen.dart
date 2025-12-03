import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../widgets/glass_container.dart';

class QRScannerScreen extends StatefulWidget {
  static const String routeName = '/qr_scanner';

  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();
  bool _isScanned = false;

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void _handleBarcode(BarcodeCapture capture) {
    if (_isScanned) return;

    final List<Barcode> barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      if (barcode.rawValue != null) {
        setState(() {
          _isScanned = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Attendance Marked: ${barcode.rawValue}'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );

        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.pop(context);
          }
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Scan Attendance',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController,
              builder: (context, state, child) {
                switch (state.torchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                  case TorchState.unavailable:
                    return const Icon(Icons.no_flash, color: Colors.grey);
                  case TorchState.auto:
                    return const Icon(Icons.flash_auto, color: Colors.white);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController,
              builder: (context, state, child) {
                switch (state.cameraDirection) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                  case CameraFacing.external:
                    return const Icon(Icons.camera);
                  case CameraFacing.unknown:
                    return const Icon(Icons.camera);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(controller: cameraController, onDetect: _handleBarcode),

          Container(
            decoration: ShapeDecoration(
              shape: QrScannerOverlayShape(
                borderColor: Theme.of(context).primaryColor,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: GlassContainer(
              blur: 10,
              color: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Align the QR code within the frame to mark your attendance.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QrScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutSize;

  const QrScannerOverlayShape({
    this.borderColor = Colors.red,
    this.borderWidth = 10.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 80),
    this.borderRadius = 0,
    this.borderLength = 40,
    this.cutOutSize = 250,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path getLeftTopPath(Rect rect) {
      return Path()
        ..moveTo(rect.left, rect.bottom)
        ..lineTo(rect.left, rect.top)
        ..lineTo(rect.right, rect.top);
    }

    return getLeftTopPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final width = rect.width;
    final height = rect.height;
    final cutOutWidth = cutOutSize;
    final cutOutHeight = cutOutSize;

    final backgroundPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final boxPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill;

    final cutOutRect = Rect.fromCenter(
      center: rect.center,
      width: cutOutWidth,
      height: cutOutHeight,
    );

    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(rect),
        Path()..addRRect(
          RRect.fromRectAndRadius(cutOutRect, Radius.circular(borderRadius)),
        ),
      ),
      backgroundPaint,
    );

    final r = borderRadius;
    final l = borderLength;
    final t = borderWidth / 2;

    canvas.drawLine(
      Offset(cutOutRect.left, cutOutRect.top + l),
      Offset(cutOutRect.left, cutOutRect.top + r),
      borderPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(cutOutRect.left + r, cutOutRect.top + r),
        radius: r,
      ),
      3.14,
      1.57,
      false,
      borderPaint,
    );
    canvas.drawLine(
      Offset(cutOutRect.left + r, cutOutRect.top),
      Offset(cutOutRect.left + l, cutOutRect.top),
      borderPaint,
    );

    canvas.drawLine(
      Offset(cutOutRect.right - l, cutOutRect.top),
      Offset(cutOutRect.right - r, cutOutRect.top),
      borderPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(cutOutRect.right - r, cutOutRect.top + r),
        radius: r,
      ),
      4.71,
      1.57,
      false,
      borderPaint,
    );
    canvas.drawLine(
      Offset(cutOutRect.right, cutOutRect.top + r),
      Offset(cutOutRect.right, cutOutRect.top + l),
      borderPaint,
    );

    canvas.drawLine(
      Offset(cutOutRect.right, cutOutRect.bottom - l),
      Offset(cutOutRect.right, cutOutRect.bottom - r),
      borderPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(cutOutRect.right - r, cutOutRect.bottom - r),
        radius: r,
      ),
      0,
      1.57,
      false,
      borderPaint,
    );
    canvas.drawLine(
      Offset(cutOutRect.right - r, cutOutRect.bottom),
      Offset(cutOutRect.right - l, cutOutRect.bottom),
      borderPaint,
    );

    canvas.drawLine(
      Offset(cutOutRect.left + l, cutOutRect.bottom),
      Offset(cutOutRect.left + r, cutOutRect.bottom),
      borderPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(cutOutRect.left + r, cutOutRect.bottom - r),
        radius: r,
      ),
      1.57,
      1.57,
      false,
      borderPaint,
    );
    canvas.drawLine(
      Offset(cutOutRect.left, cutOutRect.bottom - r),
      Offset(cutOutRect.left, cutOutRect.bottom - l),
      borderPaint,
    );
  }

  @override
  ShapeBorder scale(double t) {
    return QrScannerOverlayShape(
      borderColor: borderColor,
      borderWidth: borderWidth * t,
      overlayColor: overlayColor,
    );
  }
}
