import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/authentication/authentication.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text(SLang.of(context).signIn),
              onTap: () {
                // Update the state of the app.context
                context
                    .read<AuthenticationBloc>()
                    // .add(AuthenticationLandingRequested());
                    .add(AuthenticateSignInRequested());
                // ...
              },
            ),
            ListTile(
              title: Text(SLang.of(context).homelogout),
              onTap: () {
                // Update tcontext
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
                // ...
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                //   final tokenId = context.select((AuthenticationBloc bloc) =>
                //     bloc.state.tokenPair!.tokenId ?? '---');
                return Text('UserID: 888');
              },
            ), ////
            ElevatedButton(
              child: Text(SLang.of(context).homelogout),
              onPressed: () {
                /* context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());*/
              },
            ),
          ],
        ),
      ),
    );
  }
}
