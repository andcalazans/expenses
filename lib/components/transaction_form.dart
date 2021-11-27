import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  // after remove titleController and valueController need insert const
  TransactionForm(
    this.onSubmit, {
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
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: () {
                    final title = titleController.text;
                    final value = double.tryParse(
                          valueController.text.toString(),
                        ) ??
                        0.0;
                    onSubmit(title, value);
                  },
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
