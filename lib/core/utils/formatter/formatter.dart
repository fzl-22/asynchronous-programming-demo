import 'package:intl/intl.dart';

String dateFormatter(DateTime date) => DateFormat.yMd().add_jm().format(date);
