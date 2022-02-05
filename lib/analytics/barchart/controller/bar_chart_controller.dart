import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/analytics/barchart/state/bar_chart_state.dart';
import 'package:sentezel/analytics/controller/analytics_controller.dart';

class BarChartController extends StateNotifier<BarChartState> {
  final Reader _read;
  BarChartController(this._read)
      : super(
          BarChartState(
              barchartGroupDataList: [], titlesData: FlTitlesData(), maxY: 20),
        );

  generate() {
    final analyticsControllerState = _read(analyticsControllerProvider).data;
    //----generate barChart Group Data
    // ---genearte titles Data-------
    FlTitlesData flTitlesData = FlTitlesData(
      show: true,
      //-----Generate Left title-----------
      leftTitles: SideTitles(getTitles: (double value){
        
      })
    );
  }
}
