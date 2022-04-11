import 'package:flutter/material.dart';
import 'package:pharmaplay_cpanel/src/dashboard/components/header.dart';
import 'package:pharmaplay_cpanel/src/dashboard/druggroup/druggroup.dart';
import 'package:pharmaplay_cpanel/src/dashboard/drugs/view/drug_view.dart';
import 'package:pharmaplay_cpanel/src/utlites/sforms_style.dart';
import 'package:pharmaplay_cpanel/src/utlites/responsive.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: const [
                      //const MyFiles(),
                      DrugGroupsView(),
                      SizedBox(height: defaultPadding),
                      //const RecentFiles(),
                      //PostsList(),
                      DrugsView(),
                      /*  if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) const StarageDetails(),*/
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                /* if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StarageDetails(),
                  ),*/
              ],
            )
          ],
        ),
      ),
    );
  }
}
