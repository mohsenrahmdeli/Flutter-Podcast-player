import 'package:amata_podcast/widgets/app_text_fields.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'سلام',
            style: textTheme.titleLarge,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 35,
                child: Center(
                    child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
              ),
            ),
          ]),
      body: SizedBox(
        // width and height
        width: double.infinity,
        height: double.infinity,
        // coulmn
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            // search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              width: MediaQuery.of(context).size.width,
              height: 0.09 * MediaQuery.of(context).size.height,
              // color: Colors.blue,
              child: AppTextFields(
                controller: searchController,
                hintText: 'پادکست...',
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.all(8),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.onPrimary,
                      //shadow
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 25,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                            child: Stack(
                          children: [
                            Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            const Center(
                              child: Icon(Icons.play_arrow),
                            )
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // LinearProgressIndicator(),
                                Text(
                                    'ابوالفضل مشهدی: اهمیت یادگیری برنامه نویسی'),
                              ]),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {},
                        ),
                        Visibility(
                          visible: index == 2 ||
                                  index == 5 ||
                                  index == 7 ||
                                  index == 10
                              ? true
                              : false,
                          child: const Icon(
                            Icons.lock,
                            // color: Theme.of(context).colorScheme.secondary,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
