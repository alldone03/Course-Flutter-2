import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function myFunction;
  NewTransaction({required this.myFunction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // const NewTransaction ({super.key});
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  _submitData() {
    try {
      if (_amountController.text.isEmpty) {
        return;
      }
      final enteredTitle = _titleController.text;
      final enteredAmount = double.parse(_amountController.text);
      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return NewTransaction(myFunction: widget.myFunction);
      }
      widget.myFunction(enteredTitle, enteredAmount, _selectedDate);
    } catch (e) {}
  }

  _showDateTime() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 5)),
            lastDate: DateTime.now().add(Duration(days: 5)))
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
      print(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 10,
              // color: Colors.red,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(color: Colors.grey[400]!),
                  color: Colors.grey[400]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: "Title"),
                  keyboardType: TextInputType.text,
                  onSubmitted: (_) => _submitData,
                ),
                TextField(
                  controller: _amountController,
                  decoration: InputDecoration(labelText: "Amount"),
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        (_selectedDate == null)
                            ? "No Choose"
                            : "Date: ${DateFormat.yMMMMd().format(_selectedDate!)}",
                        style: TextStyle(
                            // fontSize: 20,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: _showDateTime,
                      child: Text(
                        "Choose Date",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: _submitData,
                  style: TextButton.styleFrom(foregroundColor: Colors.purple),
                  child: Text("Add Transaction"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
