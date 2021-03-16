// import 'package:flutter/material.dart';

// class DatePicker extends StatefulWidget {
//   @override
//   _DatePickerState createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   DateTime currentDate = DateTime.now();
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime pickedDate = await showDatePicker(
//         context: context,
//         initialDate: currentDate,
//         firstDate: DateTime(2015),
//         lastDate: DateTime(2050));
//     if (pickedDate != null && pickedDate != currentDate)
//       setState(() {
//         currentDate = pickedDate;
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           // Text(currentDate.toString()),
//           IconButton(
//             icon: Icon(Icons.calendar_today_rounded),
//             onPressed: () => _selectDate(context),
//           ),
//         ],
//       ),
//     );
//   }
// }
