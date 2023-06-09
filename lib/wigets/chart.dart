import 'package:flutter/material.dart';
import 'package:flutter_complete_guide2/models/transaction.dart';
import 'package:flutter_complete_guide2/wigets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart({required this.recentTransaction});

  List<Map<String, Object>> get grupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0;
        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekDay.day &&
              recentTransaction[i].date.month == weekDay.month &&
              recentTransaction[i].date.year == weekDay.year) {
            totalSum += recentTransaction[i].amount;
          }
        }
        // print(DateFormat.E().format(weekDay));
        // print(totalSum);

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    );
  }

  double get totalSpending {
    return grupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(grupedTransactionValues.toString());
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: grupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: (data['day'] as String),
                spendingAmount: (data['amount'] as double),
                spendingPctOfTotal: (totalSpending == 0.0)
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
