import 'package:flutter/material.dart';
import 'package:flutter_template/utils/theme_config.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red.shade800,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '04\nSept',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Friday',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.textDarkGreyColor,
                  ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '-₹700.22',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.red.shade800,
                      ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.track_changes,
                      size: 14,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '2',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppTheme.textDarkGreyColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
