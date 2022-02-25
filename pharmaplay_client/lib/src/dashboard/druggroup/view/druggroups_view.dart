import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/dashboard/druggroup/druggroup.dart';
import 'package:pharmaplay_client/src/utlites/sforms_style.dart';
import 'package:pharmaplay_client/src/utlites/responsive.dart';
import 'druggroup_info_card.dart';

class DrugGroupsView extends StatelessWidget {
  const DrugGroupsView({
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
              SLang.of(context).drugGroups,
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
          mobile: DrugGroupInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: const Center(child: DrugGroupInfoCardGridView()),
          desktop: DrugGroupInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 0.8 : 0.8,
          ),
        ),
      ],
    );
  }
}

class DrugGroupInfoCardGridView extends StatelessWidget {
  const DrugGroupInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1 / 2,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrugGroupBloc, DrugGroupState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 300,
            child: GridView.builder(
              //physics: const NeverScrollableScrollPhysics(),
              //shrinkWrap: true,
              itemCount: context.read<DrugGroupBloc>().state.drugGroups.length,
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
              itemBuilder: (context, index) => DrugGroupInfoCard(
                  dragGroupInfo:
                      context.read<DrugGroupBloc>().state.drugGroups[index]),
            ),
          ),
        );
      },
    );
  }
}
