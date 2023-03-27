import 'package:flutter/material.dart';
import 'package:flutter_complete_guide2/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteItem;

  TransactionList({required this.transactions, required this.deleteItem});
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
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 200, child: Image.asset("assets/image/waiting.png"))
            ],
          )
        : Flexible(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 10,
                  child: ListTile(
                    leading: Container(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                          child: Text(
                        "\$${transactions[index].amount.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColorLight),
                      )),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text(
                      "${DateFormat.yMMMEd().format(transactions[index].date)}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        AlertDialog(
                          actions: [
                            TextButton(onPressed: () {}, child: Text("cancel")),
                            TextButton(onPressed: () {}, child: Text("ok")),
                          ],
                        );
                        deleteItem(transactions[index].id);
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
