import 'package:flutter/material.dart';
import 'package:flutter_complete_guide2/models/transaction.dart';
import 'package:flutter_complete_guide2/wigets/new_transaction.dart';
import 'package:flutter_complete_guide2/wigets/transaction_list.dart';

import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(
      home: HomeApp(),
    ));

class HomeApp extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter APP"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("Chart"),
              elevation: 5,
            ),
          ),
          NewTransaction(),
          TransactionList(),
        ],
      ),
    );
  }
}
