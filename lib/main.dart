import 'package:flutter/material.dart';
import 'package:flutter_complete_guide2/models/transaction.dart';
import 'package:flutter_complete_guide2/wigets/chart.dart';
import 'package:flutter_complete_guide2/wigets/new_transaction.dart';
import 'package:flutter_complete_guide2/wigets/transaction_list.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          secondaryHeaderColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            // ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeApp(),
      ),
    );

class HomeApp extends StatefulWidget {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //     id: "t2",
    //     title: "Weekly Groceries",
    //     amount: 16.53,
    //     date: DateTime.now())
  ];
  List<Transaction> get _recentTransaction {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  void _addNewTransaction(String title, double amount) {
    final newTX = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      widget._userTransactions.add(newTX);
    });
    Navigator.of(context).pop();
  }

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(
              myFunction: _addNewTransaction,
            ),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expanses"),
        actions: [
          IconButton(
            onPressed: () => _startAddTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddTransaction(context),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransaction: widget._recentTransaction),
            TransactionList(transactions: widget._userTransactions)
          ],
        ),
      ),
    );
  }
}
