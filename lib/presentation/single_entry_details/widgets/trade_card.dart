import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template/utils/responsive_utils.dart';
import 'package:flutter_template/utils/theme_config.dart';

class TradeCard extends StatelessWidget {
  const TradeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: CupertinoContextMenu(
        enableHapticFeedback: true,
        actions: [
          CupertinoContextMenuAction(
            onPressed: () {},
            trailingIcon: CupertinoIcons.pencil,
            child: Text(
              'Edit',
              style: TextStyle(
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
            ),
          ),
          CupertinoContextMenuAction(
            trailingIcon: CupertinoIcons.delete,
            onPressed: () {},
            child: Text(
              'Delete',
              style: TextStyle(
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
            ),
          ),
        ],
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 400,
            maxWidth: 400,
            minHeight: 50,
            maxHeight: 100,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 21,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18),
            child: Row(
              children: [
                Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 60,
                      minHeight: 60,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.red.shade800,
                        width: 1,
                      ),
                      color: Colors.red.shade50,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '-₹300',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.red.shade800,
                            fontWeight: FontWeight.w800,
                            fontSize: Sizer.of(context).fontSize(14.5),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nifty 50 300 PE 20234521',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppTheme.textDarkGreyColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green.shade800,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'BUY: ₹212',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          const SizedBox(width: 13),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red.shade800,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'SELL: ₹212',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '100 QTY',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppTheme.textDarkGreyColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
