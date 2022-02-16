import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/authentication/authentication.dart';

import 'home_layout.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

/*
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: RepositoryProvider(
        create: (context) => GameRepository(service: GameService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AllGamesBloc>(
              create: (context) => AllGamesBloc(
                gameRepository: context.read<GameRepository>(),
              )..add(GetGames()),
            ),
            BlocProvider<CategoryBloc>(
              create: (context) => CategoryBloc(
                gameRepository: context.read<GameRepository>(),
              )..add(GetCategories()),
            ),
            BlocProvider<GamesByCategoryBloc>(
              create: (context) => GamesByCategoryBloc(
                gameRepository: context.read<GameRepository>(),
              ),
            ),
          ],
          child: HomeLayout(),
        ),
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'type in Drug Info...',
            hintStyle: TextStyle(
              //backgroundColor: Colors.white,
              // color: Colors.blue,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
            //border: InputBorder.none,
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 28,
            ),
          )
        ],
        centerTitle: true,
      ),
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
      body: HomeLayout(),
    );
  }
}
