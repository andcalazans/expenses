import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  // final titleController = TextEditingController();
  // final valueController = TextEditingController();

  const TransactionForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const TextField(
              // controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            const TextField(
              // controller: titleController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: () => {},
                  child: const Text('Nova Transação'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
