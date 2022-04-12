import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmaplay_cpanel/generated/l10n.dart';
import 'package:pharmaplay_cpanel/src/imagepicker/imagepicker.dart';

//import '../forgot_password.dart';

class ImagePickerPage extends StatelessWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ImagePickerPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(SLang.of(context).resetPassword)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return ImagePickerBloc();
          },
          child: const ImagePickerForm(), // LoginForm(),
        ),
      ),
    );
  }
}
