import 'dart:async';

import 'package:amata_podcast/main_screen.dart';
import 'package:amata_podcast/widgets/app_elevated_button.dart';
import 'package:amata_podcast/widgets/app_text_fields.dart';
import 'package:flutter/material.dart';

class PinputScreen extends StatefulWidget {
  const PinputScreen({super.key});

  @override
  State<PinputScreen> createState() => _PinputScreenState();
}

class _PinputScreenState extends State<PinputScreen> {
  final TextEditingController _textController = TextEditingController();
  Timer? _debounceTimer;
  final int debounceDelay = 1500;
  int _remainingTime = 120; // Initial countdown time
  Timer? _timer;
  bool isCounting = true;

  void _startTimer() {
    isCounting = true;
    _stopTimer(); // Stop any existing timer
    setState(() {
      _remainingTime = 120; // Reset to 10 seconds
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          isCounting = false;
          _stopTimer(); // Stop when the timer hits 0
        }
      });
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _textController.dispose();
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            // style: TextButton.styleFrom(fixedSize: const Size(200, 20)),
            child: const Text('تغییر شماره'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        children: [
          const SizedBox(height: 120),
          const Text(
              'لطفا شماره ۵ رقمی که به شماره شما ارسال شده است را وارد کنید...'),
          const SizedBox(height: 8),
          AppTextFields(
            controller: _textController,
            textInputType: TextInputType.number,
            onChanged: (value) {
              // Cancel previous debounce timer
              if (_debounceTimer?.isActive ?? false) {
                _debounceTimer?.cancel();
              }
              // Start a new debounce timer
              _debounceTimer =
                  Timer(Duration(milliseconds: debounceDelay), () async {
                if (value.length == 5) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                    ModalRoute.withName('/'),
                  );
                }
              });
            },
            hintText: '12345',
          ),
          const SizedBox(height: 8),
          AppElevatedButton(
            title: isCounting ? formatTime(_remainingTime) : 'ارسال مجدد کد',
            onPressed: isCounting
                ? null
                : () {
                    _startTimer();
                  },
          ),
        ],
      ),
    );
  }
}
