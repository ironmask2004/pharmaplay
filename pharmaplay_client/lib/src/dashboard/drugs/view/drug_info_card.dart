import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/dashboard/components/drug_rating.dart';
import 'package:pharmaplay_client/src/dashboard/dashboard.dart';
import 'package:pharmaplay_client/src/utlites/sforms_style.dart';

class DrugInfoCard extends StatelessWidget {
  const DrugInfoCard({Key? key, required this.drugInfo, required this.index})
      : super(key: key);

  final DrugRecord drugInfo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: context.read<DashBoardBloc>().state.secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                height: 80,
                width: 80,
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
            drugInfo.drug.brandName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          DrugRating(
            rating: (double.parse(drugInfo.drug.drugRating)), //--111
          ),
          /*ProgressLine(
            color:
                Color(int.parse('0xF3DAEB41') + drugInfo.drug.drugPrice * 1000),
            percentage: (drugInfo.drug.drugPrice / 20000 * 100).toInt(),
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                drugInfo.manufactory.manufactoryName,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.fade,

                style: Theme.of(context).textTheme.caption!.copyWith(
                    color: context
                        .read<DashBoardBloc>()
                        .state
                        .fontbodyColor), //+70
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '(${drugInfo.drug.drugPrice} ${SLang.of(context).mony} )',
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
