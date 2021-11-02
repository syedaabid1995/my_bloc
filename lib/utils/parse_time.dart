
import 'package:intl/intl.dart';

class ParseDate{
  String parse(String date){
    DateTime parseDate =
    new DateFormat("yyyy-MM-dd").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd MMM, yyyy');
    String outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

}