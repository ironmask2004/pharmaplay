import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:pharmaplay_client/src/dashboard/dashboard.dart';
import 'package:pharmaplay_client/src/utlites/sforms_style.dart';

class DrugGroupInfoCard extends StatelessWidget {
  const DrugGroupInfoCard({
    Key? key,
    required this.dragGroupInfo,
  }) : super(key: key);

  final DrugGroup dragGroupInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: context.read<DashBoardBloc>().state.secondaryColor,
        borderRadius: const BorderRadius.all(const Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: context
                      .read<DashBoardBloc>()
                      .state
                      .primaryColor
                      .withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  "assets/icons/drop_box.svg",
                  color: context.read<DashBoardBloc>().state.primaryColor,
                ),
              ),
              Icon(Icons.more_vert,
                  color:
                      context.read<DashBoardBloc>().state.fontbodyColor) //+45
            ],
          ),
          Text(
            dragGroupInfo.drugGroupName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const ProgressLine(
            color: Color(0xF3DAEB41),
            percentage: 90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${dragGroupInfo.drugGroupID}",
                style: Theme.of(context).textTheme.caption!.copyWith(
                    color: context
                        .read<DashBoardBloc>()
                        .state
                        .fontbodyColor), //+70
              ),
              Text(
                '(Drugs#)',
                style: Theme.of(context).textTheme.caption!.copyWith(
                    color: context.read<DashBoardBloc>().state.fontbodyColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color, // =  context.read<DashBoardBloc>().state.primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
