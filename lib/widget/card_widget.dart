import 'package:wave_project/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardWidget extends StatefulWidget {
  final bool? isClickable;

  const CardWidget({super.key, this.isClickable});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isClickable == null) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const ScanScreen();
            },
          ));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: const AssetImage('assets/images/bg_card.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.purple.shade200.withOpacity(0.4), BlendMode.srcIn)),
        ),
        height: 220,
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 75),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QrImageView(
                data: 'Isi',
                version: QrVersions.auto,
                size: 145.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo_camera),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Scanner')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
