import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  // after remove titleController and valueController need insert const
  TransactionForm(
    this.onSubmit, {
    Key? key,
  }) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(
          valueController.text.toString(),
        ) ??
        0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

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
              onSubmitted: (value) => _submitForm(),
            ),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ), // Esse também funciona no iOS
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
              onSubmitted: (value) => _submitForm(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: _submitForm,
                  child: const Text('Adicionar Transação'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
