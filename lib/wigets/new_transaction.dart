import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction ({super.key});
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
            ),
            TextButton(
                onPressed: () {
                  print(titleController.text);
                  print(amountController.text);
                },
                style: TextButton.styleFrom(foregroundColor: Colors.purple),
                child: Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}
