import 'package:flutter/material.dart';
import 'package:pharmaplay_client/src/home/view/testfreezed.dart';

class NameC extends StatelessWidget {
  const NameC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var testfreezed = TestFreezed(name: 'Remi', age: 24);
    print(testfreezed.name); // Remi
    print(testfreezed.toJson());

    var testf2 = testfreezed.copyWith(age: 44);
    var testf3 = testfreezed; // 24

    return Container();
  }
}
