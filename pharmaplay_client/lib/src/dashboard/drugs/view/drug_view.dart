import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/dashboard/drugs/drug.dart';
import 'package:pharmaplay_client/src/utlites/sforms_style.dart';
import 'package:pharmaplay_client/src/utlites/responsive.dart';

class DrugsView extends StatelessWidget {
  const DrugsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              SLang.of(context).drugs,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add New"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: DrugInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: const Center(child: DrugInfoCardGridView()),
          desktop: DrugInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 0.8 : 0.8,
          ),
        ),
      ],
    );
  }
}

class DrugInfoCardGridView extends StatelessWidget {
  const DrugInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1 / 2,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrugBloc, DrugState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 390,
            child: GridView.builder(
              //physics: const NeverScrollableScrollPhysics(),
              //shrinkWrap: true,
              itemCount: context.read<DrugBloc>().state.drugs.length,
              scrollDirection: Axis.horizontal,

              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: defaultPadding,
                mainAxisSpacing: defaultPadding,
                childAspectRatio: childAspectRatio,
                maxCrossAxisExtent: 180,
                // childAspectRatio: 1 / 2,
                // crossAxisSpacing: 20,
                // mainAxisSpacing: 20
              ),
              itemBuilder: (context, index) => DrugInfoCard(
                  drugInfo: context.read<DrugBloc>().state.drugs[index]),
            ),
          ),
        );
      },
    );
  }
}