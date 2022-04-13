import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:pharmaplay_cpanel/generated/l10n.dart';
import 'package:pharmaplay_cpanel/src/dashboard/components/drug_rating.dart';
import 'package:pharmaplay_cpanel/src/dashboard/dashboard.dart';
import 'package:pharmaplay_cpanel/src/dashboard/drugs/drug.dart';
import 'package:pharmaplay_cpanel/src/utlites/sforms_style.dart';
import 'package:pharmaplay_cpanel/src/widgets/card_popup_menu.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding * 0.15),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: context
                      .read<DashBoardBloc>()
                      .state
                      .primaryColor
                      .withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: GestureDetector(
                    child: SvgPicture.asset(
                      "assets/icons/drop_box.svg",
                      color: context.read<DashBoardBloc>().state.primaryColor,
                    ),
                    onDoubleTap: () {
                      print('onDoubleTap drugID: ${drugInfo.drug.drugID}');
                      context
                          .read<DrugBloc>()
                          .add(DrugImagePickerPressed(drugInfo.drug.drugID));
                    } //do something,
                    ),
              ),
              CardPopUpMenu(
                key: key,
                onEdit: () {
                  print('OnEdit ${drugInfo.drug.drugID}');
                },
                onDelete: () {
                  print('onDelete ${drugInfo.drug.drugID}');
                },
                onInfo: () {
                  print('onInfo ${drugInfo.drug.drugID}');
                },
              ),
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
