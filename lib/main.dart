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

class TestConfig extends StatelessWidget {
  const TestConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              height: 100,
              width: 230,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                color: Colors.blue,
                height: 100,
                width: 200,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                color: Colors.green,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    //     date: DateTime.now()),
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
    //     date: DateTime.now()),
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
    //     date: DateTime.now()),
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
    //     date: DateTime.now()),
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
    //     date: DateTime.now()),
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
    //     date: DateTime.now()),
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
    //     date: DateTime.now()),
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
    //     date: DateTime.now()),
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
    //     date: DateTime.now()),
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
  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTX = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);

    setState(() {
      widget._userTransactions.add(newTX);
    });
    Navigator.of(context).pop();
  }

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (_) {
          return NewTransaction(
            myFunction: _addNewTransaction,
          );
        });
  }

  void _deleteItem(String id) {
    // print(id);
    setState(() {
      widget._userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CaWang"),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Chart(recentTransaction: widget._recentTransaction),
          TransactionList(
            transactions: widget._userTransactions,
            deleteItem: _deleteItem,
          ),
        ],
      ),
    );
  }
}
