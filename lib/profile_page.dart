import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isButtonVisible = false;
  bool isCreator = true;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  endIndent: 5,
                  indent: 5,
                ),
                const SizedBox(height: 8),
                const Text('اطلاعات حساب کاربری'),
                Card(
                  margin: const EdgeInsets.all(
                    8.0,
                  ),
                  //color: Theme.of(context).colorScheme.surface,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          
                          textDirection: TextDirection.rtl,
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade300,
                            hintText: 'نام',
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          textDirection: TextDirection.rtl,
                          controller: _userNameController,
                          decoration:  InputDecoration(
                            fillColor: Colors.grey.shade300,
                            hintText: 'نام کاربری',
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          textDirection: TextDirection.rtl,
                          controller: _passwordController,
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration:  InputDecoration(
                            fillColor: Colors.grey.shade300,
                            hintText: 'رمز عبور',
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
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
                if (isCreator) ...[
                  const Text('پنل مدیریت محتوا'),
                  const SizedBox(
                    height: 8,
                  ),
                  const Card(
                    child: ListTile(
                      title: Text('گزارشات'),
                      leading: Icon(Icons.bar_chart),
                    ),
                  ),
                ],
                const SizedBox(
                  height: 8,
                ),
                const Text('اعمال حساب کاربری'),
                const SizedBox(
                  height: 8,
                ),
                const Card(
                  child: ListTile(
                    title: Text('خروج از حساب کاربری'),
                    leading: Icon(Icons.logout),
                  ),
                ),
                // CircleAvatar(
                //   radius: 70,
                //   backgroundColor: Colors.blueGrey[100],
                //   child: const Icon(
                //     Icons.person,
                //     size: 120,
                //     color: Colors.blueGrey,
                //   ),
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                // const Divider(
                //   endIndent: 5,
                //   indent: 5,
                // ),
                // Card(
                //   margin: EdgeInsets.all(
                //     8.0,
                //   ),
                //   color: Theme.of(context).colorScheme.surface,
                //   elevation: 5,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(
                //       15,
                //     ),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(
                //       16.0,
                //     ),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.stretch,
                //       children: [
                //         TextField(
                //           textDirection: TextDirection.rtl,
                //           controller: _firstNameController,
                //           decoration: const InputDecoration(
                //             hintText: 'اطلاعات حساب کاربری',
                //             hintTextDirection: TextDirection.rtl,
                //             border: OutlineInputBorder(
                //               borderRadius: BorderRadius.all(
                //                 Radius.circular(
                //                   25,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //         const SizedBox(
                //           height: 15,
                //         ),
                //         TextField(
                //           textDirection: TextDirection.rtl,
                //           controller: _userNameController,
                //           decoration: const InputDecoration(
                //             hintText: 'اطلاعات محتوا',
                //             hintTextDirection: TextDirection.rtl,
                //             border: OutlineInputBorder(
                //               borderRadius: BorderRadius.all(
                //                 Radius.circular(
                //                   25,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //         const SizedBox(
                //           height: 5,
                //         ),
                //         if (isButtonVisible)
                //           Align(
                //             alignment: Alignment.centerRight,
                //             child: ElevatedButton(
                //               onPressed: () {},
                //               child: const Text('ذخیره'),
                //             ),
                //           ),
                //       ],
                //     ),
                //   ),
                // ),
                // Card(
                //   color: Theme.of(context).colorScheme.surface,
                //   elevation: 5,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(
                //       15,
                //     ),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(
                //       16.0,
                //     ),
                //     child: ElevatedButton(
                //       onPressed: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) {
                //               return ChartScreen();
                //             },
                //           ),
                //         );
                //       },
                //       child: Text(
                //         'دیدن آمارها',
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
