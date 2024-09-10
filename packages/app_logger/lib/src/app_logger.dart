import 'package:logger/logger.dart';

final logger = Logger(
    level: Level.all,
    printer: PrefixPrinter(
      PrettyPrinter(
        methodCount: 1,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
      ),
    ),
    filter: DevelopmentFilter());
