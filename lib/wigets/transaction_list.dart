import 'package:flutter/material.dart';
import 'package:flutter_complete_guide2/models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
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
                  "\$${tx.amount.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tx.title, style: Theme.of(context).textTheme.titleMedium
                      // TextStyle(
                      //   fontSize: 18,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      ),
                  Text(
                    "${DateFormat.yMMMd().format(tx.date)}",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
