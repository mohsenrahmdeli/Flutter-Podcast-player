import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نمودار'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: Colors.black, width: 2),
                      bottom: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: const [
                        FlSpot(0, 3),
                        FlSpot(1, 1),
                        FlSpot(2, 4),
                        FlSpot(3, 1.5),
                        FlSpot(4, 2),
                        FlSpot(5, 3.1),
                        FlSpot(6, 4),
                      ],
                      belowBarData: BarAreaData(show: false),
                      dotData: FlDotData(show: true),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              color: Theme.of(context).colorScheme.surface,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: Column(
                  children: [
                    Text('میزان شنیده شده ها'),
                    SizedBox(
                      height: 15,
                    ),
                    LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('0'),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('3000'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("آمار پادکست ها"),
                          Text("تعداد"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.red,
                        child: ListView.builder(
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text('عنوان تستی پادکست'),
                                trailing: Text('30'),
                                leading: Icon(Icons.mic),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
