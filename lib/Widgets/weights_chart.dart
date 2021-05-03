import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dailyweight/Models/weight.dart';


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeightChart extends StatelessWidget {
  final List<Weight> data;

  WeightChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Weight, String>> series = [
      charts.Series(
          id: "Weight",
          data: data,
          domainFn: (Weight series, _) => DateFormat.MMMd().format(series.date).toString(),
          measureFn: (Weight series, _) => series.weight,
          colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault.lighter,)
    ];

    return Container(
      height: 0.333*MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
    
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}