import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenseList;
  final Function(Expense expense) removeExpense;

  const ExpensesList(
      {super.key, required this.expenseList, required this.removeExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) => removeExpense(
          expenseList[index],
        ),
        key: ValueKey(expenseList[index]),
        child: ExpenseItem(
          expense: expenseList[index],
        ),
      ),
    );
  }
}
