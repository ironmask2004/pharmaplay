import 'package:flutter/material.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/widgets/container_body.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const HeaderTitle(),
          const SizedBox(height: 20.0),
          ContainerBody(
            children: [
              //CategoriesWidget(),
              //GamesByCategoryWidget(),
              //AllGamesWidget(title: 'All games'),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        //   final tokenId = context.select((AuthenticationBloc bloc) =>
                        //     bloc.state.tokenPair!.tokenId ?? '---');
                        return const Text('UserID: 888');
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
            ],
          )
        ],
      ),
    );
  }
}
