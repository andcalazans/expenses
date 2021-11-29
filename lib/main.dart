import 'dart:math';

import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  // const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 'to',
      title: 'Conta muito antiga',
      value: 3310.90,
      date: DateTime.now().subtract(
        const Duration(days: 33),
      ),
    ),
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.90,
      date: DateTime.now().subtract(
        const Duration(days: 3),
      ),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 739.20,
      date: DateTime.now().subtract(
        const Duration(days: 1),
      ),
    ),
    // Transaction(
    //   id: 't3',
    //   title: 'Conta de Luz',
    //   value: 739.20,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't4',
    //   title: 'Conta de Luz',
    //   value: 739.20,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't5',
    //   title: 'Conta de Luz',
    //   value: 739.20,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't6',
    //   title: 'Conta de Luz',
    //   value: 739.20,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't6',
    //   title: 'Conta de Luz',
    //   value: 739.20,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't6',
    //   title: 'Conta de Luz',
    //   value: 739.20,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't6',
    //   title: 'Conta de Luz',
    //   value: 739.20,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't6',
    //   title: 'Conta de Luz',
    //   value: 739.20,
    //   date: DateTime.now(),
    // )
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });

    // Remove a coisa que está mais na frente da tela (com maior índice: zindex)
    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais',
            style: TextStyle(
                // fontFamily: 'OpenSans',
                // fontWeight: FontWeight.w700,
                )),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            // width: double.infinity,
            child: Chart(_recentTransactions),
          ),
          TransactionList(transactions: _transactions),
          // TransactionUser(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
    );
  }
}
