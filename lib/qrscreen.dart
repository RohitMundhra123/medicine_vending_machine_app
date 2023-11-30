import 'package:flutter/material.dart';
import 'package:medicine_vending_machine/main.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key, required this.medicinename, required this.dose});

  final String medicinename;
  final int dose;

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
            size: 20,
          ),
        ),
        backgroundColor: const Color(0xFF000000),
        title: Text(
          widget.medicinename,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: QrImageView(
                data: "Name:- ${widget.medicinename}, Doses:- ${widget.dose}",
                size: 250,
              ),
            ),
          )
        ],
      ),
    );
  }
}
