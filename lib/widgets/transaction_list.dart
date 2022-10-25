import './transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx, {Key? key})
      : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');

    return widget.transactions.isEmpty
        ? LayoutBuilder(
            builder: ((context, constraints) {
              return Column(
                children: [
                  Text(
                    'No Transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png'),
                  ),
                ],
              );
            }),
          )
        : ListView(
            children: [
              ...widget.transactions
                  .map(
                    (tx) =>
                        TransactionItem(key: ValueKey(tx.id),transaction: tx, deleteTx: widget.deleteTx,),
                  )
                  .toList()
            ],
          );
  }
}
