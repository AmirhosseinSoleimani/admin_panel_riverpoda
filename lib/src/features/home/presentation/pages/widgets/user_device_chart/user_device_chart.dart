import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserDeviceChart extends StatefulWidget {
  const UserDeviceChart({super.key});

  @override
  State<UserDeviceChart> createState() => _UserDeviceChartState();
}

class _UserDeviceChartState extends State<UserDeviceChart> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.all(AppPadding.p8),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
              width: AppSize.s2,
              color: Theme.of(context).colorScheme.secondaryContainer
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${textLocalization.userByDevice}:', style: Theme.of(context).textTheme.displayLarge),
            AspectRatio(
              aspectRatio: 1.7,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1.8,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback: (FlTouchEvent event, pieTouchResponse) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  touchedIndex = -1;
                                  return;
                                }
                                touchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              });
                            },
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Indicator(
                        color: ColorThemeManager.blue,
                        text: textLocalization.desktop,
                        isSquare: true,
                      ),
                      Space.h4,
                      Indicator(
                        color: ColorThemeManager.lightBlue,
                        text: textLocalization.tablet,
                        isSquare: true,
                      ),
                      Space.h4,
                      Indicator(
                        color: ColorThemeManager.lightBlue2,
                        text: textLocalization.mobile,
                        isSquare: true,
                      ),
                      Space.h16,
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: ColorThemeManager.blue,
            value: 40,
            title: '30%',
            radius: radius,
            titleStyle:Theme.of(context).textTheme.bodyMedium,
          );
        case 1:
          return PieChartSectionData(
            color: ColorThemeManager.lightBlue,
            value: 30,
            title: '15%',
            radius: radius,
            titleStyle: Theme.of(context).textTheme.bodyMedium,
          );
        case 2:
          return PieChartSectionData(
            color: ColorThemeManager.lightBlue2,
            value: 15,
            title: '55%',
            radius: radius,
            titleStyle: Theme.of(context).textTheme.bodyMedium,
          );
        case 3:
        default:
          throw Error();
      }
    });
  }
}
