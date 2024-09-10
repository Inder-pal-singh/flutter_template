import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template/presentation/single_entry_details/widgets/trade_card.dart';
import 'package:flutter_template/widgets/primary/back_button.dart';

import 'widgets/add_trade_sheet.dart';

class SingleEntry extends StatefulWidget {
  const SingleEntry({super.key});

  @override
  State<SingleEntry> createState() => _SingleEntryState();
}

class _SingleEntryState extends State<SingleEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const KBackButton(),
        title: Text('Monday, 29 July 2024',
            style: Theme.of(context).textTheme.titleMedium?.copyWith()),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => const AddTradeSheet(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const CircleAvatar(
          radius: 30,
          child: Icon(Icons.add, size: 30, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Big Loss 🎯',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                      ),
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                TextFormField(
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  minLines: 5,
                  maxLines: 11,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Trades',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                const TradeCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
