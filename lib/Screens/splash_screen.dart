import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isButtonVisible = false;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_checkFields);
    _userNameController.addListener(_checkFields);
    _passwordController.addListener(_checkFields);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _checkFields() {
    setState(() {
      isButtonVisible = _firstNameController.text.isNotEmpty ||
          _userNameController.text.isNotEmpty ||
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blueGrey[100],
                  child: const Icon(
                    Icons.person,
                    size: 120,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 25),
                const Divider(endIndent: 5, indent: 5),
                const SizedBox(height: 30),
                TextField(
                  textDirection: TextDirection.rtl,
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    hintText: 'نام',
                    hintTextDirection: TextDirection.rtl,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  textDirection: TextDirection.rtl,
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    hintText: 'نام کاربری',
                    hintTextDirection: TextDirection.rtl,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  textDirection: TextDirection.rtl,
                  controller: _passwordController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: const InputDecoration(
                    hintText: 'رمز عبور',
                    hintTextDirection: TextDirection.rtl,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                if (isButtonVisible)
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('ذخیره'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.red.shade900,
        width: double.infinity,
        height: 50.0,
      ),
    );
  }
}
