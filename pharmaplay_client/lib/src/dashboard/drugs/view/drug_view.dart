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
            /* ElevatedButton.icon(
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

class DrugInfoCardGridView extends StatefulWidget {
  const DrugInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1 / 2,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<DrugInfoCardGridView> createState() => _DrugInfoCardGridViewState();
}

class _DrugInfoCardGridViewState extends State<DrugInfoCardGridView>
    with TickerProviderStateMixin {
  final _scrollController = ScrollController();
  late AnimationController aniController;

  @override
  void initState() {
    aniController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });

    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrugBloc, DrugState>(
      listener: (context, state) {
        print(state.status.toString() +
            '00000000000000000000000000000000000000000000000000000000000000');
        if (state.status == DrugStatus.scrolloading ||
            state.status == DrugStatus.initializing) {
          /*  CircularProgressIndicator(
            value: aniController.value,
            semanticsLabel: 'Linear progress indicator',
          );*/

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(SLang.of(context).loading)));
        }

        if (state.status == DrugStatus.success) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
      },
      child: BlocBuilder<DrugBloc, DrugState>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 440,
              child: GridView.builder(
                //physics: const NeverScrollableScrollPhysics(),
                //shrinkWrap: true,
                itemCount: context.read<DrugBloc>().state.drugs.length,
                scrollDirection: Axis.horizontal,
                controller: _scrollController,

                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: defaultPadding,
                  mainAxisSpacing: defaultPadding,
                  childAspectRatio: widget.childAspectRatio,
                  maxCrossAxisExtent: 220,
                  // childAspectRatio: 1 / 2,
                  // crossAxisSpacing: 20,
                  // mainAxisSpacing: 20
                ),
                itemBuilder: (context, index) => DrugInfoCard(
                    drugInfo: context.read<DrugBloc>().state.drugs[index],
                    index: index),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    aniController.dispose();

    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<DrugBloc>().add(const DrugsScrolledd());
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
