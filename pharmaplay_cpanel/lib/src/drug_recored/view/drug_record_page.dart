import 'package:pharma_repository/pharma_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmaplay_cpanel/generated/l10n.dart';
import 'package:pharmaplay_cpanel/src/drug_recored/drug_record.dart';

class DrugRecordPage extends StatelessWidget {
  const DrugRecordPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const DrugRecordPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(SLang.of(context).drugRecord)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return DrugRecordBloc(
              pharmaRepository:
                  RepositoryProvider.of<PharmaRepository>(context),
            );
          },
          child: const DrugRecordForm(), // LoginForm(),
        ),
      ),
    );
  }
}
