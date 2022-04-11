import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmaplay_cpanel/generated/l10n.dart';
import 'package:pharmaplay_cpanel/src/dashboard/druggroup/druggroup.dart';
import 'package:pharmaplay_cpanel/src/utlites/sforms_style.dart';
import 'package:pharmaplay_cpanel/src/utlites/responsive.dart';

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
            /*  ElevatedButton.icon(
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
            ),*/
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

class DrugGroupInfoCardGridView extends StatefulWidget {
  const DrugGroupInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1 / 2,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<DrugGroupInfoCardGridView> createState() =>
      _DrugGroupInfoCardGridViewState();
}

class _DrugGroupInfoCardGridViewState extends State<DrugGroupInfoCardGridView> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrugGroupBloc, DrugGroupState>(
        listener: (context, state) {
          print(state.status.toString() +
              '00000000000000000000000000000000000000000000000000000000000000');
          if (state.status == DrugGroupStatus.scrolloading ||
              state.status == DrugGroupStatus.initializing) {
            /*  CircularProgressIndicator(
            value: aniController.value,
            semanticsLabel: 'Linear progress indicator',
          );*/

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                  SnackBar(content: Text(SLang.of(context).loading)));
          }

          if (state.status == DrugGroupStatus.success) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
        },
        child: BlocBuilder<DrugGroupBloc, DrugGroupState>(
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            return SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: GridView.builder(
                  //physics: const NeverScrollableScrollPhysics(),
                  //shrinkWrap: true,
                  itemCount:
                      context.read<DrugGroupBloc>().state.drugGroups.length,
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: defaultPadding,
                    mainAxisSpacing: defaultPadding,
                    childAspectRatio: widget.childAspectRatio,
                    maxCrossAxisExtent: 180,
                    // childAspectRatio: 1 / 2,
                    // crossAxisSpacing: 20,
                    // mainAxisSpacing: 20
                  ),
                  itemBuilder: (context, index) => DrugGroupInfoCard(
                      dragGroupInfo: context
                          .read<DrugGroupBloc>()
                          .state
                          .drugGroups[index]),
                ),
              ),
            );
          },
        ));
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<DrugGroupBloc>().add(const DrugGroupsScrolledd());
      //context.read<PostBloc>().add(PostFetched());
      print('Is Butooooom');
    } else
      print('Nor Boootm!!!!');
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
