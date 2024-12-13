import 'package:flutter/material.dart';

class EpisodeCard extends StatelessWidget {
  final int index;
  const EpisodeCard({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // LinearProgressIndicator(),
              Text('ابوالفضل مشهدی: اهمیت یادگیری برنامه نویسی'),
            ]),
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          Visibility(
            visible: index == 2 || index == 5 || index == 7 || index == 10
                ? true
                : false,
            child: const Icon(
              Icons.lock,
              // color: Theme.of(context).colorScheme.secondary,
            ),
          )
        ],
      ),
    );
  }
}
