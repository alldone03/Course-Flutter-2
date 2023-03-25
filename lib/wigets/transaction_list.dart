import 'package:flutter/material.dart';
import 'package:flutter_complete_guide2/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    // print(transactions[0].amount);
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                "No Transaction Aded",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                  height: 200, child: Image.asset("assets/image/waiting.png"))
            ],
          )
        : Container(
            height: 300,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: EdgeInsets.all(10),
                        // color: Colors.teal,
                        child: Text(
                          "\$${transactions[index].amount.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transactions[index].title,
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                            "${DateFormat.yMMMMd().format(transactions[index].date)}",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
  }
}
