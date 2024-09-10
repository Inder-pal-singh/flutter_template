import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/theme_config.dart';

showLoadingDialog(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: kDebugMode,
    builder: (v) => const Center(
            child: CircularProgressIndicator(
          color: AppTheme.primaryGrayColor,
          strokeWidth: 1,
        )));
