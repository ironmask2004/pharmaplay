import 'package:flutter/material.dart';

class HorizPage extends StatelessWidget {
  const HorizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: GridView(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 1 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                '1',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                '2',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                '3',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                '4',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                '5',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                '6',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                '7',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: const Text(
                '8',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
