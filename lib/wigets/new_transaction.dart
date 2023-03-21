import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function myFunction;
  NewTransaction({required this.myFunction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // const NewTransaction ({super.key});
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  submitData() {
    try {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);
      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return NewTransaction(myFunction: widget.myFunction);
      }
      widget.myFunction(enteredTitle, enteredAmount);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            TextButton(
                onPressed: submitData,
                style: TextButton.styleFrom(foregroundColor: Colors.purple),
                child: Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}
