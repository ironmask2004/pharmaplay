import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmaplay_client/src/widgets/error_widget.dart';

import 'all_games_barrel.dart';

class AllGamesWidget extends StatelessWidget {
  const AllGamesWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllGamesBloc, AllGamesState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? AllGamesSuccessWidget(
                title: title,
                games: state.games.results,
              )
            : state.status.isLoading
                ? RepositoryProvider(
                    create: (context) => SubjectRepository(),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : state.status.isError
                    ? const ErrorGameWidget()
                    : const SizedBox();
      },
    );
  }
}
