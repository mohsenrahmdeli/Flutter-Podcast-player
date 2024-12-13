import 'package:amata_podcast/login_as_creator_screen.dart';
import 'package:amata_podcast/pinput_screen.dart';
import 'package:amata_podcast/widgets/app_elevated_button.dart';
import 'package:amata_podcast/widgets/app_text_button.dart';
import 'package:amata_podcast/widgets/app_text_fields.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          children: [
            const SizedBox(height: 230),
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
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextButton(
                  title: 'ورود پادکستر',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const LoginAsCreatorScreen();
                      },
                    ));
                  },
                ),
                const Text('محتوا تولید میکنی؟'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
