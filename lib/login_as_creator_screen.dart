import 'package:amata_podcast/pinput_screen.dart';
import 'package:amata_podcast/widgets/app_elevated_button.dart';
import 'package:amata_podcast/widgets/app_text_fields.dart';
import 'package:flutter/material.dart';

class LoginAsCreatorScreen extends StatefulWidget {
  const LoginAsCreatorScreen({super.key});

  @override
  State<LoginAsCreatorScreen> createState() => _LoginAsCreatorScreenState();
}

class _LoginAsCreatorScreenState extends State<LoginAsCreatorScreen> {
  final TextEditingController _textController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void dispose() {
    _textController.dispose();

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
            child: const Text('بازگشت'),
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          children: [
            const SizedBox(height: 120),
            const Text('شماره تماس خود را وارد نمایید...'),
            const SizedBox(height: 8),
            AppTextFields(
              controller: _textController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'لطفا شماره تماس خود را وارد نمایید';
                }
                if ((value?.length ?? 0) != 11) {
                  return 'لطفا شماره تماس معتبر وارد نمایید';
                }
                return null;
              },
              hintText: 'مثال: ۰۹۳۹۱۵۴۳۷۰۲',
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            AppElevatedButton(
              title: 'ورود',
              onPressed: () {
                if (_form.currentState!.validate()) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const PinputScreen();
                    },
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
