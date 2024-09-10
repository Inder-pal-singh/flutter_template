import 'package:flutter/material.dart';
import 'package:flutter_template/widgets/primary/form_field.cmp.dart';
import 'package:flutter_template/widgets/primary/primary_button.cmp.dart';

class AddTradeSheet extends StatefulWidget {
  const AddTradeSheet({super.key});

  @override
  State<AddTradeSheet> createState() => _AddTradeSheetState();
}

class _AddTradeSheetState extends State<AddTradeSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Trade'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14.0),
        child: PrimaryButton(
          onPressed: () {},
          child: const Text('Add Trade'),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 20,
            children: <Widget>[
              AppTextFormField(
                label: 'Trade/Symbol Name',
                hint: 'Eg: Nifty 21900 PE',
              ),
              AppTextFormField(
                hint: 'Eg: 29.23',
                label: 'Buy Price',
                keyboardType: TextInputType.number,
              ),
              AppTextFormField(
                label: 'Sell Price',
                hint: 'Eg: 39.23',
                keyboardType: TextInputType.number,
              ),
              AppTextFormField(
                label: 'Quantity',
                hint: 'Eg: 100',
                keyboardType: TextInputType.numberWithOptions(decimal: false),
              ),
              AppTextFormField(label: 'Trade Time', hint: 'Eg: 10:30 AM'),
              AppTextFormField(
                label: 'Trade Notes',
                hint: 'Eg: Bought at 10:30 AM',
                maxLines: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
