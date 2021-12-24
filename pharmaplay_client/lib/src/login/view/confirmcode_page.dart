import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmaplay_client/src/login/login.dart';

class ConfirmCodePage extends StatelessWidget {
  const ConfirmCodePage(this.email, this.password, {Key? key})
      : super(key: key);
  final String email;
  final String password;

  static Route route(String email, String password) {
    return MaterialPageRoute<void>(
        builder: (_) => ConfirmCodePage(email, password));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ConfirmCode')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: ConfirmCodeForm(email, password), // LoginForm(),
        ),
      ),
    );
  }
}